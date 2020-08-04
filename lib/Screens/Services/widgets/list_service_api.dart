import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Services/widgets/CardApiImage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListServiceApi extends StatefulWidget {
  User user;

  ListServiceApi({this.user});
  @override
  _ListServiceApiState createState() => _ListServiceApiState();
}

class _ListServiceApiState extends State<ListServiceApi> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('imageServices').orderBy("action", descending: false).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData || snapshot.hasError){
          print("Nopo");
          return Scaffold(
            body: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }else {
          List<CardImageApi> cards = new List();
          snapshot.data.documents.forEach((element) {
            print(element.documentID);
            var action = element['action'];
            var urlImage = element['urlImage'];
            var name = element['name'];

            cards.add(CardImageApi(action: action, urlImage: urlImage, name:name,  user: widget.user,));

          });

          return Container(
              margin: EdgeInsets.only(top:10),
              padding: EdgeInsets.only(bottom:10),
              child: Center(
                child: ListView(
                  children: cards,
              ),
            ),
          );
        }
      }
    );
  }
}
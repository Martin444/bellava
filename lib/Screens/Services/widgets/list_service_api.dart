import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Services/widgets/CardApiImage.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListServiceApi extends StatefulWidget {
  // User user;

  // ListServiceApi({this.user});
  @override
  _ListServiceApiState createState() => _ListServiceApiState();
}

class _ListServiceApiState extends State<ListServiceApi> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(
      builder:(_)=> StreamBuilder(
        stream: Firestore.instance.collection('imageServices').orderBy('action', descending: false).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData || snapshot.hasError){
            return  Center(
                  child: CircularProgressIndicator(),
                );
             ;
          }else {
            List<CardImageApi> cards = List();
            snapshot.data.documents.forEach((element) {
              var action = element['action'];
              var urlImage = element['urlImage'];
              var name = element['name'];
              
              cards.add(CardImageApi(action: action, urlImage: urlImage, name:name,  ));

            });

            return  Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:
                              
                              Row(
                                children: cards,
                              ),

                             
                            
                      ),
              
                
                Container(
                height: 200,
                width: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.0),
                      Color.fromRGBO(255, 255, 255, 0.3),
                      Color.fromRGBO(255, 255, 255, 0.6),
                      Color.fromRGBO(255, 255, 255, 0.9),
                      Color.fromRGBO(255, 255, 255, 0.9),
                    ],
                    begin: FractionalOffset(0.0, 0.5),
                    end: FractionalOffset(1.0, 0.5),
                    // stops: [1.0, 0.6],
                  tileMode: TileMode.clamp
                  )
                ),
              ),
              ],
            );
              

             
            
           
          }
        }
      ),
    );
  }
}
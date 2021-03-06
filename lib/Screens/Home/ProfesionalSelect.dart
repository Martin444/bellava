import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Screens/Home/widget/ProfesionalCard.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfesionalSelect extends StatefulWidget {
  FormInfo info;
  String name;

  ProfesionalSelect({@required this.info, @required this.name});
  @override
  _ProfesionalSelectState createState() => _ProfesionalSelectState();
}

class _ProfesionalSelectState extends State<ProfesionalSelect> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .where('active', isEqualTo: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var cardp = <ProfesionalCard>[];
            snapshot.data.documents.forEach((e) {
              var userName = e.data['displayName'];
              var userDesc = e.data['description'];
              var userServicePhoto = e.data['photos'];
              var userPhoto = e.data['photoURL'] ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHgwL4r2DN1qg91OOqIViiv0Uxw-9yqo-PiQ&usqp=CAU';

              cardp.add(ProfesionalCard(
                userId: e.documentID,
                info: widget.info,
                userName: userName,
                userDescript: userDesc,
                userPhoto: userPhoto,
                userServicePhoto: userServicePhoto,
              ));
            });
            return Scaffold(
              body: Stack(
                children: [
                  BackGradient(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SafeArea(
                          child: Container(
                            width: Get.width,
                            padding: EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                Container(
                                  width: Get.width,
                                  height: 90,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                    'Selecciona a tu profesional',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  child: FlatButton(
                                    child: Center(
                                        child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black87,
                                    )),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: cardp,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

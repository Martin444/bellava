import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Home/widget/eyebrow.dart';
import 'package:bellava/Screens/Home/widget/manicure.dart';
import 'package:bellava/Screens/Home/widget/manicureandpedicure.dart';
import 'package:bellava/Screens/Home/widget/masaje.dart';
import 'package:bellava/Screens/Home/widget/pedicure.dart';
import 'package:bellava/Screens/Services/widgets/CardService.dart';
import 'package:flutter/material.dart';

class ListServiceEyebrow extends StatefulWidget {

  User user;

  ListServiceEyebrow(this.user);

  @override
  _ListServiceEyebrowState createState() => _ListServiceEyebrowState();
}

class _ListServiceEyebrowState extends State<ListServiceEyebrow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan[400],
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                      CardService("PESTAÑAS", 'assets/pestanas.png', (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Eyebrow();
                        }));
                    }), 
                    CardService("CEJAS", 'assets/cejas.png', (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Eyebrow();
                      })); 
                    }),

          ],
        ),
          ]),
    ));
  }
}
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Home/widget/eyebrow.dart';
import 'package:bellava/Screens/Home/widget/manicure.dart';
import 'package:bellava/Screens/Home/widget/manicureandpedicure.dart';
import 'package:bellava/Screens/Home/widget/masaje.dart';
import 'package:bellava/Screens/Home/widget/pedicure.dart';
import 'package:bellava/Screens/Services/widgets/CardService.dart';
import 'package:flutter/material.dart';

class ListServiceManicure extends StatefulWidget {

  User user;

  ListServiceManicure(this.user);

  @override
  _ListServiceManicureState createState() => _ListServiceManicureState();
}

class _ListServiceManicureState extends State<ListServiceManicure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan[400],
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.3),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                      CardService("MANICURE", 'assets/manicura.png', (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Manicure();
                        }));
                    }), 
                    CardService("PEDICURE", 'assets/bellezapies.png', (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Pedicure();
                      }
                    )
                  ); 
                }),
              ],
            ),

            CardService("MANICURE y PEDICURE", 'assets/maniypedi.png', (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return ManiAndPedi();
                        }));
                    }), 
          ]),
    ));
  }
}
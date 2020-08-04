import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Home/widget/eyebrow.dart';
import 'package:bellava/Screens/Home/widget/face_tabs.dart';
import 'package:bellava/Screens/Home/widget/manicure.dart';
import 'package:bellava/Screens/Home/widget/manicureandpedicure.dart';
import 'package:bellava/Screens/Home/widget/masaje.dart';
import 'package:bellava/Screens/Home/widget/pedicure.dart';
import 'package:bellava/Screens/Services/widgets/ListService.dart';
import 'package:bellava/Screens/Services/widgets/ListServiceManicure.dart';
import 'package:flutter/material.dart';

class CardImageApi extends StatefulWidget {

  int action;
  String urlImage;
  String name;
  User user;

  CardImageApi({this.action, this.urlImage, this.name, this.user});
  @override
  _CardImageApiState createState() => _CardImageApiState();
}

class _CardImageApiState extends State<CardImageApi> {
  @override
  Widget build(BuildContext context) {

    actionRoute(){
      if (widget.action == 2){
        Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Manicure(user:widget.user);
                    }));
      } else if(widget.action == 3){
        Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Pedicure(widget.user);
                    }));

      }else if(widget.action == 4){
        Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ManiAndPedi(widget.user);
                    }));
      } else if(widget.action == 5){
        Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return FaceTabs(widget.user);
                    }));
      } else if(widget.action == 6){
        Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Eyebrow(widget.user);
                    }));
      } else if(widget.action == 7){
        Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Masaje(widget.user);
                    }));
      }
    }

    print(widget.action);

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
        actionRoute();
      },
      child: Container(
        width: screenWidth / 1,
        height: 135,
        padding: EdgeInsets.only(top:10, left: 10, right: 10),
        // margin: EdgeInsets.only(top: 5),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:widget.action != 1 ? Colors.black38 : Colors.white,
                blurRadius: 10.0,
                  offset: Offset(0.0, 7.0)
              )
            ],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("${widget.urlImage}"))
          ),
          
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: EdgeInsets.only(left:15, top:10),
              child: widget.name != null ? Text("${widget.name}", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold
              ),
              )
              :
              Container()
              ),
          ),
        ),
      ),
    );
  }
}
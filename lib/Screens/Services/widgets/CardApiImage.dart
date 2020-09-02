import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Home/widget/eyebrow.dart';
import 'package:bellava/Screens/Home/widget/face_tabs.dart';
import 'package:bellava/Screens/Home/widget/manicure.dart';
import 'package:bellava/Screens/Home/widget/manicureandpedicure.dart';
import 'package:bellava/Screens/Home/widget/masaje.dart';
import 'package:bellava/Screens/Home/widget/pedicure.dart';
import 'package:bellava/Screens/Services/widgets/ListService.dart';
import 'package:bellava/Screens/Services/widgets/ListServiceManicure.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardImageApi extends StatefulWidget {
  int action;
  String urlImage;
  String name;
  // User user;

  CardImageApi({
    this.action,
    this.urlImage,
    this.name,
  });
  @override
  _CardImageApiState createState() => _CardImageApiState();
}

class _CardImageApiState extends State<CardImageApi> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    Color setCOlor (){
      switch (widget.action) {
        case 1:
            return Color.fromRGBO(250, 208, 211, 0.4);
          break;
        case 2:
            return Color.fromRGBO(250, 208, 211, 0.4);
          break;
        case 3:
            return Color.fromRGBO(243, 227, 249, 0.4);
          break;
        case 4:
            return Color.fromRGBO(250, 208, 211, 0.4);
          break;
        case 5:
            return Color.fromRGBO(250, 203, 203, 0.4);
          break;
        case 6:
            return Color.fromRGBO(247, 213, 224, 0.4);
          break;
        case 7:
            return Color.fromRGBO(212, 238, 255, 0.4);
          break;
        default:
      }
    }

    return GetBuilder<ServiceController>(builder: (_) {
      return GestureDetector(
        onTap: () {
          _.setDataCardsImage(widget.urlImage);
          _.actionRoute(widget.action);
        },
        child: Container(
          width: screenWidth / 2.3,
          height: 200,
          padding: EdgeInsets.only(top: 10, right: 20),
          // margin: EdgeInsets.only(top: 5),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: widget.action != 1 ? Colors.black12 : Colors.white,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 7.0))
                ],
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${widget.urlImage}"))),
            child: Container(
              decoration: BoxDecoration(
                color: setCOlor(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                  margin: EdgeInsets.only( top: 15, bottom: 10),
                  alignment: AlignmentDirectional.topCenter,
                  child: widget.name != null
                      ? Text(
                          '${widget.name}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300),
                        )
                      : Container()),
            ),
          ),
        ),
      );
    });
  }
}

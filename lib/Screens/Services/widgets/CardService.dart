import 'package:flutter/material.dart';

class CardService extends StatefulWidget {
  String title;
  String urlImage;
  VoidCallback onCallback;

  CardService(this.title, this.urlImage, this.onCallback);

  @override
  _CardServiceState createState() => _CardServiceState();
}

class _CardServiceState extends State<CardService> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCallback,
          child: Container(
        margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
        width: MediaQuery.of(context).size.width / 2.3,
        height: MediaQuery.of(context).size.height / 4.1,
        decoration: BoxDecoration(
          boxShadow:[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ],
        borderRadius: BorderRadius.circular(50)
        ),
              child: Container(
                alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // boxShadow: <BoxShadow>[
                    //   BoxShadow (
                    //     color:  Colors.grey[600],
                    //     offset: Offset(4.0, 4.0),
                    //     blurRadius: 6.0,
                    //     spreadRadius: 1.0
                    //   ),
                    //   BoxShadow (
                    //     color:  Colors.white,
                    //     offset: Offset(-4.0, -4.0),
                    //     blurRadius: 15.0,
                    //     spreadRadius: 1.0
                    //   )
                    // ],
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white
                      ] 
                      ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset(widget.urlImage, fit: BoxFit.cover, scale: 4),
                        Center(
                          child: Text(
                              widget.title,
                              textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                      ],
                    ),
          ),
      ),
    );
  }
}
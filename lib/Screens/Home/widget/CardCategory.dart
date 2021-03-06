import 'package:bellava/Utils/SIzeConfig.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';

class CardCategory extends StatefulWidget {
  String title;
  String urlImage;
  String price;
  int count;
  VoidCallback onPressAdd;
  VoidCallback onPressRemove;
  String info;

  CardCategory(this.title, this.price, this.count, this.onPressAdd,
      this.onPressRemove, this.info);

  @override
  _CardCategoryState createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        children: <Widget>[
          Container(
            width: SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 0, bottom: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    //Descripcion y precio
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: 310,
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                              SizedBox(height: 8),
                              Text(
                                widget.info,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 22,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Monserrat',
                                    color: Color(0xff446F7A)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // button remove
                          Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.only(right: 1),
                                onPressed: widget.onPressRemove,
                                child: Icon(Icons.remove),
                                color: Colors.white,
                              )),
                          Container(
                            // text counter
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: opacityCeleste2,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "${widget.count}",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                          ),
                          Container(
                            //button add
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.only(right: 1),
                              onPressed: widget.onPressAdd,
                              child: Icon(Icons.add),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

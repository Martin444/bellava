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

  CardCategory(this.title, this.price, this.count, this.onPressAdd, this.onPressRemove, this.info);

  @override
  _CardCategoryState createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical:15),
        child: Stack(
          alignment: Alignment(1, -2.4),
          children: <Widget>[
            Container(//Rectangulo 
              height: MediaQuery.of(context).size.height / 5.8,
              width: SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                boxShadow:[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15.0,
                      offset: Offset(4.0, 7.0)
                  )
                ],
              color: Color(0xFFB78DD9),
              borderRadius: BorderRadius.circular(20),
              ),

              child:Container(
                padding: EdgeInsets.only(left:10, top:0, bottom:9),
                child: Row(
                  children: <Widget>[
                    Column(//Descripcion y precio
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            width: 195,
                            child: SafeArea(
                              child: Text(widget.title,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width /20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                              ),
                            ),
                          ),

                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.attach_money, 
                              color: Colors.white,),
                              Text(
                                '${widget.price} Pesos',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                            ],
                          ),
                        ),
                      
                      ],
                    ),
                    
                      
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                      Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 39,
                          width: 50,
                          child: PopupMenuButton(
                            child: FlatButton(
                              child: Icon(Icons.info_outline,
                              color: Colors.white,
                              size: 25,
                              ),
                            ),
                            itemBuilder:( context) => [
                              PopupMenuItem(
                                value: "info",
                                child: Text(widget.info,
                                  style: TextStyle(
                                    color: Colors.blueGrey
                                  )
                                ),
                                
                                )
                            ]
                            
                            )
                        ),

                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                                
                            Container( // button remove
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.only(right:1),
                                onPressed: widget.onPressRemove,
                                child: Icon(Icons.remove),
                                color: Colors.white,
                                )
                              ),
                         
                            Container( // text counter
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              child: Text("${widget.count}",
                              style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width /17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                              ),
                            ),

                            Container( //button add
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
                                padding: EdgeInsets.only(right:1),
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
        ],),
    );
   
  }
}
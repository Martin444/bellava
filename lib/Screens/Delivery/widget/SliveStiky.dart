import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/masajes.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/widget/map.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';
import 'package:simple_moment/simple_moment.dart';

class ListSticky extends StatefulWidget {
  FormInfo info;
  // User user;

  ListSticky({
    Key key,
    this.info,
    // this.user,
  }) : super(key: key);

  @override
  _ListStickyState createState() => _ListStickyState();
}

class _ListStickyState extends State<ListSticky> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            height: 450,
            alignment: Alignment.bottomCenter,
            child: CustomScrollView(
              slivers: <Widget>[
                _StickyHeaderList(
                  index: 0,
                  inform: widget.info,
                  //  user: widget.user,
                ),
                _StickyHeaderList(
                  index: 1,
                  inform: widget.info,
                  //  user: widget.user,
                ),
                _StickyHeaderList(
                  index: 2,
                  inform: widget.info,
                  //  user: widget.user,
                ),
                _StickyHeaderList(
                  index: 3,
                  inform: widget.info,
                  //  user: widget.user,
                ),
                _StickyHeaderList(
                  index: 4,
                  inform: widget.info,
                  //  user: widget.user,
                ),
                _StickyHeaderList(
                  index: 5,
                  inform: widget.info,
                  //  user: widget.user,
                ),
                _StickyHeaderList(
                  index: 6,
                  inform: widget.info,
                  //  user: widget.user,
                ),
              ],
            )),
      ],
    );
  }
}

class _StickyHeaderList extends StatefulWidget {
  FormInfo inform;
  // User user;

  _StickyHeaderList({
    Key key,
    this.index,
    this.inform,
    // this.user,
  }) : super(key: key);

  final int index;

  @override
  __StickyHeaderListState createState() => __StickyHeaderListState();
}

class __StickyHeaderListState extends State<_StickyHeaderList> {
  String titleHora;
  String selectHora;

  var horanow = DateTime.now().hour;
  var compare = 21 - DateTime.now().hour;

  _showTitleHora() {
    if (horanow > 9) {
      // print(compare);

    } else if (horanow < 9) {
      // print(compare - compare);
      setState(() {
        compare = 13;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showTitleHora();
  }

  // Elevamos el sheet para mostrar cuanto se sumó

  _showBottonSheet(int sum) {
    return showModalBottomSheet(
        elevation: 17.0,
        backgroundColor: Colors.white,
        context: context,
        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
        builder: (context) {
          var nuevoTotal = widget.inform.price + sum;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Costo del servicio",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueGrey),
                          ),
                          Text(
                            "${widget.inform.price} Pesos",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: Color(0xff77D499)),
                          ),
                        ],
                      ),
                
                 Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Cargo por demanda",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.blueGrey),
                                ),
                                Text(
                                  "${sum} Pesos",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                      color: Color(0xff77D499)),
                                ),
                              ],
                            )
                        
                   ],
                 ),
                 
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Total a pagar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.blueGrey),
                          ),
                          Text(
                            "${nuevoTotal} Pesos",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color(0xff77D499)),
                          ),
                        ],
                      ),
               
                Container(
                      height: 50,
                      width: 150,
                      // margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FlatButton(
                            color: Color(0xff77D499),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    "Siguiente",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.arrow_forward, color: Colors.white,)
                                ],
                              ),
                            ),
                            onPressed: () {
                              print(widget.inform.services);
                              var infoWDate = FormInfo(
                                  fecha: selectHora,
                                  descripcion: widget.inform.descripcion,
                                  flexible: widget.inform.flexible,
                                  calle: "",
                                  barrio: widget.inform.barrio,
                                  vivienda: "",
                                  numeroTelefono: widget.inform.numeroTelefono,
                                  services: widget.inform.services,
                                  price: nuevoTotal,
                                  type: widget.inform.type);
                              Navigator.maybePop(context,
                                  {Navigator.pop(context), Navigator.pop(context)});
                              Navigator.push(
                                  context,
                                   MaterialPageRoute(
                                      builder: (BuildContext context) =>  Maped(
                                            form: infoWDate,
                                            // user: widget.user,
                                          )));
                            }),
                      ),
                ),
                   ],
                 ),
              
              
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var secondsToAdd = Duration(days: widget.index);

    var dayse = DateFormat.EEEE('es')
        .add_d()
        .format(DateTime.now().add(secondsToAdd))
        .toUpperCase();

    return SliverStickyHeader(
      header: Container(
          alignment: Alignment.center,
          height: 35,
          // padding: EdgeInsets.only(left:15),
          color: Colors.white,
          child: Text(
            widget.index == 0
                ? "HOY"
                : "${dayse}",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) {
            var horaHabil = DateTime.utc(2020)
                .add(Duration(hours: 9))
                .add(Duration(hours: i));
            var cdate = DateTime.now().hour;
            var march = DateTime.now()
                .add(Duration(days: 1))
                .difference(DateTime.now());
            var comaration = DateTime.utc(2020)
                .add(Duration(hours: 9))
                .add(Duration(hours: i));
            var horasFaltante = 24 - DateTime.now().hour;

            var come = horasFaltante + comaration.hour;
            _showSubtitle() {
              if (widget.index == 1) {
                if (come <= 23) {
                  return Text("No hay cargos");
                } else {
                  return Text("No hay cargos");
                }
              } else {
                return Text("No hay cargos");
              }
            }

            // ignore: missing_return
            Text _showSubtitle1() {
              if (widget.index == 0) {
                if (cdate >= 8) {
                  if (i <= 0 || march.inHours < 12) {
                    return Text("Alta demanda (+ 150 pesos)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  } else if (i != 0 && i < 3) {
                    return Text("Alta demanda (+ 75 pesos)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  } else {
                    return Text('No hay cargos',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    );
                  }
                } else {
                  return Text('No hay cargos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                  );
                }
              }
            }

            return Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    title: widget.index == 0
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                compare == 13
                                    ? "${DateFormat.j('es').format(horaHabil)}:00 Hs"
                                    : "${DateFormat.jm('es').format(DateTime.now().add(Duration(hours: 1)).add(Duration(hours: i)))} Hs",
                                style: TextStyle(
                                    color: Color(0xff446F7A),
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                              if (_showSubtitle() != '') Container(
                               padding: EdgeInsets.all(8),
                               decoration: BoxDecoration(
                                 color: kceleste1,
                                 borderRadius: BorderRadius.circular(10)
                               ),
                               child: _showSubtitle1()) else Container()
                          ],
                        )
                        : Text(
                            widget.index == 0
                                ? '${DateFormat.jm('es').format(DateTime.now().add(Duration(hours: 1)).add(Duration(hours: i)))} Hs'
                                : '${DateFormat.j('es').format(horaHabil)}:00 Hs',
                            style: TextStyle(
                                color: Color(0xff446F7A),
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                    // subtitle:
                    //     widget.index == 0 ? _showSubtitle1() : _showSubtitle(),
                    onTap: () {
                      var dia = dayse;
                      var hora = DateFormat.j('es').format(DateTime.utc(2020)
                          .add(Duration(hours: 9))
                          .add(Duration(hours: i)));
                      var horasHoy = DateFormat.jm('es').format(DateTime.now()
                          .add(Duration(hours: 1))
                          .add(Duration(hours: i)));
                      var hora24 = DateTime.now().hour;
                      var moment = Moment.now();
                      var comaration = DateTime.utc(2020)
                          .add(Duration(hours: 9))
                          .add(Duration(hours: i));

                      var cp = DateTime.now()
                          .add(Duration(hours: 1))
                          .add(Duration(hours: i))
                          .difference(DateTime.now());

                      var horasFaltantes = 24 - DateTime.now().hour;

                      var com = horasFaltantes + comaration.hour;

                      if (widget.index == 0) {
                        setState(() {
                          selectHora = "${dia} a las ${horasHoy} Hs";
                        });
                        // print("${horasHoy} ${hora24}");
                        if (hora24 >= 8) {
                          if (cp.inHours <= 0) {
                            _showBottonSheet(150);
                          } else if (cp.inHours >= 1 && cp.inHours < 3) {
                            _showBottonSheet(75);
                          } else {
                            _showBottonSheet(0);
                          }
                        } else {
                          _showBottonSheet(0);
                        }
                      } else if (widget.index != 0) {
                        setState(() {
                          selectHora = "${dia} a las ${hora} Hs";
                        });

                        print(com);
                        if (com <= 23) {
                          _showBottonSheet(0);
                        } else {
                          _showBottonSheet(0);
                        }
                      }
                    },
                  
                    
                  ),
                  Divider(
                    thickness: 0.2,
                    color: Colors.blueGrey,
                  )
                ],
              ),
            );
          },
          childCount: widget.index == 0 ? compare : 13,
        ),
      ),
    );
  }
}

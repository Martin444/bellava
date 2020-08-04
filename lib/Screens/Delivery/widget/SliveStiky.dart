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
  User user;
 

  ListSticky({
    Key key,
    this.info,
    this.user,
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
              _StickyHeaderList(index: 0,
               inform: widget.info,
               user: widget.user,
            
               ),
              _StickyHeaderList(index: 1,
               inform: widget.info,
               user: widget.user,
             
               ),
              _StickyHeaderList(index: 2,
               inform: widget.info,
               user: widget.user,
              
               ),
              _StickyHeaderList(index: 3,
               inform: widget.info,
               user: widget.user,
              
               ),
              _StickyHeaderList(index: 4,
               inform: widget.info,
               user: widget.user,
               
               ),
              _StickyHeaderList(index: 5,
               inform: widget.info,
               user: widget.user,
            
               ),
              _StickyHeaderList(index: 6,
               inform: widget.info,
               user: widget.user,
        
               ),
            ],
          )
        ),

        
      ],
    );
  }
}

class _StickyHeaderList extends StatefulWidget {
  FormInfo inform;
  User user;


   _StickyHeaderList({
    Key key,
    this.index,
    this.inform,
    this.user,
  }) : super(key: key);

  final int index;

  @override
  __StickyHeaderListState createState() => __StickyHeaderListState();
}

class __StickyHeaderListState extends State<_StickyHeaderList> {


    String titleHora;
    String selectHora;

    var horanow =  DateTime.now().hour;
    var compare = 21 - DateTime.now().hour;

     _showTitleHora(){    
            if(horanow > 9){
              // print(compare);
              
              }
            else if(horanow < 9){
              // print(compare - compare);
                setState(() {
                  compare = 13;
                });
              }            
    }
    @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _showTitleHora();
  }

    // Elevamos el sheet para mostrar cuanto se sumó

    _showBottonSheet(int sum){
      return showModalBottomSheet(
        backgroundColor: Colors.white,
          context: context,
          builder: (context) {
            var nuevoTotal = widget.inform.price + sum;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Servicio:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.blueGrey
                          ),
                          ),
                        Text(
                          " ${widget.inform.price} pesos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.blueGrey
                          ),
                          ),
                      ],
                    ),
                  ),

                  sum != 0 ? 
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Recargo por demanda:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.blueGrey
                          ),
                          ),
                        Text(
                          " ${ sum} pesos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.blueGrey
                          ),
                          ),
                      ],
                    ),
                  )
                  :
                  Container(),
                  
                  
                  Container( 
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Total: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.blueGrey
                          ),
                          ),
                        Text(
                          "${nuevoTotal} pesos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.blueGrey
                          ),
                          ),
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 200,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FlatButton(
                        color: korange,
                        child: Text(
                          "Siguiente",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        onPressed: (){
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
                              type: widget.inform.type
                          );
                          Navigator.maybePop(context,{
                            Navigator.pop(context),
                             Navigator.pop(context)});
                          Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new Maped(
                                form: infoWDate,
                                user: widget.user,
                              )
                          ));
                      }),
                    ),
                  ),
                ],
              ),
            );
          }
        );
    }

  @override
  Widget build(BuildContext context) {
    var secondsToAdd =  Duration(days: widget.index);

    var dayse = DateFormat.EEEE('es').add_d().format( DateTime.now().add(secondsToAdd)).toUpperCase();

    return SliverStickyHeader(
      header: Container(
        color: Color(0xFFB78DD9),
        height: 35,
        child: Center(child: Text(widget.index == 0 ? "HOY ${DateFormat.d('es').format(DateTime.now())}" : "${dayse}",
        style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ),
        sliver: SliverList(
         delegate: SliverChildBuilderDelegate(
          (context, i) { 

            var horaHabil =  DateTime.utc(2020).add(Duration(hours: 9)).add(Duration(hours: i));
            var cdate = DateTime.now().hour;
            var march = DateTime.now().add(Duration(days: 1)).difference(DateTime.now());
            var comaration =  DateTime.utc(2020).add(Duration(hours: 9)).add(Duration(hours: i));
            var horasFaltante = 24 - DateTime.now().hour;

              var come = horasFaltante + comaration.hour;
             _showSubtitle(){
              if (widget.index == 1){
                if(come <= 23 ){
                  return Text("No hay cargos");
                }else {
                  return Text("No hay cargos");
                  }
              }else {
                return Text("No hay cargos");
              }
              }

              // ignore: missing_return
              Text _showSubtitle1(){
                if (widget.index == 0){
                  if(cdate >= 8){
                    if(i <= 0 || march.inHours < 12){
                      return Text("Alta demanda! 🔥 (+ 150 pesos)");
                    }
                    else if( i != 0  && i < 3){
                      return Text("Alta demanda! 🔥 (+ 75 pesos)");
                    }

                    else {
                      return Text("No hay cargos");
                    }
                  } else {
                    return Text("No hay cargos");

                  }
                } 
                
              }

             
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                
                leading: Icon(
                  Icons.alarm
                ),
                title: widget.index == 0  ? Text(compare == 13 ?
                 "${DateFormat.j('es').format(horaHabil)}:00 Hs"
                  :"${DateFormat.jm('es').format( DateTime.now().add(Duration(hours: 1)).add(Duration(hours: i)))} Hs",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),

                  )
                :
                
                Text( widget.index == 0  ? 
                '${DateFormat.jm('es').format( DateTime.now().add(Duration(hours: 1)).add(Duration(hours: i)))} Hs' 
                : 
                '${DateFormat.j('es').format(horaHabil)}:00 hs',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 21,
                  fontWeight: FontWeight.bold
                ),
                ),

                subtitle: widget.index == 0 ? _showSubtitle1() : _showSubtitle(),
                onTap: (){
                  var dia = dayse;
                  var hora = DateFormat.j('es').format( DateTime.utc(2020).add(Duration(hours: 9)).add(Duration(hours: i)));
                  var horasHoy = DateFormat.jm('es').format( DateTime.now().add(Duration(hours: 1)).add(Duration(hours: i)));
                  var hora24 =  DateTime.now().hour;
                  var moment = Moment.now();
                  var comaration =  DateTime.utc(2020).add(Duration(hours: 9)).add(Duration(hours: i));

                  var cp = DateTime.now().add(Duration(hours: 1)).add(Duration(hours: i)).difference(DateTime.now());

                  var horasFaltantes = 24 - DateTime.now().hour;

                  var com = horasFaltantes + comaration.hour;

                  if(widget.index == 0){
                    setState(() {
                      selectHora = "${dia} a las ${horasHoy} Hs";
                    });
                    // print("${horasHoy} ${hora24}");
                      if(hora24 >= 8){
                        if(cp.inHours <= 0){
                          _showBottonSheet(150);
                        } else if (cp.inHours >= 1 && cp.inHours < 3){
                          _showBottonSheet(75);
                        } else {
                          _showBottonSheet(0);
                        }
                      } else {
                        _showBottonSheet(0);
                      }
                     

                  } else if(widget.index != 0){
                  
                    setState(() {
                      selectHora = "${dia} a las ${hora} Hs";
                    });

                    print(com);
                    if(com <= 23){
                        _showBottonSheet(0);
                      } else{
                        _showBottonSheet(0);
                    }
                  }
                },
          ),
                Divider(
                  thickness: 1,
                  color: Colors.blueGrey,
                )
              ],
            );},
          childCount: widget.index==0 ?compare :13,
        ),
      ),
    );
  }
}
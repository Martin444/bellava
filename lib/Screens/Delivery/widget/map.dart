import 'package:address_search_field/address_search_field.dart';
import 'package:bellava/Models/masajes.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/widget/button_purple.dart';
import 'package:bellava/Screens/Delivery/widget/text_input_location.dart';
import 'package:bellava/Screens/Home/home.dart';
import 'package:bellava/Screens/Success/success.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bellava/Models/formInfo.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:location/location.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Maped extends StatefulWidget {

  FormInfo form;
  User user;

  Maped({this.form,  this.user});

  @override
  _MapedState createState() => _MapedState();
}

class _MapedState extends State<Maped> {

 GoogleMapController _controller;
   // Variables para la localizacion
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  LatLng _lat = LatLng(0.0, 0.0);
  Set<Marker> markers = Set();
  String _selectedPayment = "";
  String _controllerTypeHouse = "Casa";
  
  bool isHose = true;
  bool isEdifice = false;
  bool isOffice = false;
  bool isOther = false;

  bool pressBtn = false;

  TextEditingController busqueda = TextEditingController();
  TextEditingController numPiso = TextEditingController();
  TextEditingController dpto = TextEditingController();

  BitmapDescriptor icon;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _showSnackBar(text) {
    final snackBar =  SnackBar(content: Text(text));

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


    @override
  void initState() {

    _getLocation();
    getIcon();
  }

  getIcon() async{
    var icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5), "assets/marker.png");

    setState(() {
      this.icon = icon;
    });
  }


    // Funcion que inicia la busqueda de la ubicacion
    _getLocation()async {
          _serviceEnabled = await location.serviceEnabled();
              if (!_serviceEnabled) {
                _serviceEnabled = await location.requestService();
                if (!_serviceEnabled) {
                  return;
                }
              }

              _permissionGranted = await location.hasPermission();
              if (_permissionGranted == PermissionStatus.denied) {
                _permissionGranted = await location.requestPermission();
                if (_permissionGranted != PermissionStatus.granted) {
                  return;
                }
              }


              _locationData = await location.getLocation();

              setState(() {
                _lat = LatLng(_locationData.latitude, _locationData.longitude);
                markers.add(
                  Marker(
                    markerId: MarkerId("yo"),
                    position: _lat,
                    icon: this.icon
                    )
                );
              });
  }
 
  
  @override
  Widget build(BuildContext context) {
    
    _alertPayTarget(){
      return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: CircularPercentIndicator(
              radius: 150.0,
              lineWidth: 9.0,
              percent: 1.0,
              animateFromLastPercent: true,
              animationDuration: 9000,
              animation: true,
            
              backgroundColor: Colors.white,
              center: new Text("Procesando",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700
              ),
              ),
              footer: Container(
                margin: EdgeInsets.only(top: 10),
                child: DelayedReveal(
                  delay: Duration(milliseconds: 2500),
                  child: new Text(
                    "Aguarde",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              progressColor: korange,
              circularStrokeCap: CircularStrokeCap.round,
            ),
                )
              ],
            ),
          );
        }
        
        );
    }


    _payWhitEffective(){
      Navigator.pop(context);
      Firestore.instance.collection('orders').add({
                      'state': 'En proceso',
                      'direction': busqueda.text,
                      'recolectionStart': widget.form.fecha,
                      'type': widget.form.type,
                      'description': widget.form.descripcion,
                      'neighborhood': widget.form.barrio,
                      'typeHouse' : _controllerTypeHouse == "Edificio" ? "${_controllerTypeHouse} piso ${numPiso.text} dpto.${dpto.text} ":  "${_controllerTypeHouse}",
                      'typePayment': _selectedPayment,
                      'numberPhone': widget.form.numeroTelefono,
                      'latitude': _lat.latitude,
                      'longitude': _lat.longitude,
                      'flexible': widget.form.flexible,
                      'userOwner': widget.user.name,
                      'userOwnerID': widget.user.uid,
                      'price' : widget.form.price,
                      'services': widget.form.services
                    }).then((DocumentReference dr) {
                      dr.get().then((DocumentSnapshot snapshot) {
                        DocumentReference refUsers = Firestore.instance
                            .collection('users')
                            .document(widget.user.uid);
                        refUsers.updateData({
                          'myOrders': FieldValue.arrayUnion([
                            Firestore.instance
                                .document("users/${snapshot.documentID}")
                          ])
                        });
                      });

                      Navigator.maybePop(context,{
                            Navigator.pop(context),
                             Navigator.pop(context),
                        
                             
                             });
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) =>
                        new SuccessScreen()
                      ));
                    
                    });
    }

 
 //DIalog para el pago en efectivo
    createAlertDialog(BuildContext context) {

      List<Text> servs = new List<Text>();

      widget.form.services.forEach((e) {
       

        e != null ? 
          servs.add(Text(e,
            style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Lato"),
          ))
          : 
          null;
      });

          bool can = false;
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              title: Text("Total: ${widget.form.price}"),
              content: Container(
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        widget.form.services.length >= 1
                            ? Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Column(
                                  children: <Widget>[
                                    Text("Servicios:",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Lato"),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: servs,
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: <Widget>[],
                              ),
                       
                        Column(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                "Dia/Hora del servicio:",
                                style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Lato"),
                                ),
                             Text(
                                "${widget.form.fecha}",
                                style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Lato"),
                                ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Total: ",
                                style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Lato"),
                              ),
                            Text(
                              " ${widget.form.price} Pesos",
                              style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Lato"),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[

                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                    ),
                  elevation: 1,
                  child:  Text("Cancelar"),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                ),
               
                MaterialButton(
                   color: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                    ),
                  elevation: 3,
                  child:Text(
                    "Confirmar",
                    style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lato",
                          ),
                    ),
                  onPressed: () {
                    _payWhitEffective();
                  },
                ),
              ],
            );
          });
    }


   
    _showBottomSheet() {
      return showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              height: 150,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        "Pagar con",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text("Tarjeta de Crédito o Débito"),
                    onTap: () {

                      Navigator.pop(context);
                      
                     _alertPayTarget();
                    
                    Firestore.instance.collection('orders').add({
                              'state': 'A pagar',
                              'direction': busqueda.text,
                              'recolectionStart': widget.form.fecha,
                              'type': widget.form.type,
                              'description': widget.form.descripcion,
                              'neighborhood': widget.form.barrio,
                              'typeHouse' : _controllerTypeHouse == "Edificio" || _controllerTypeHouse == "Oficina" ? "${_controllerTypeHouse} piso ${numPiso.text} dpto.${dpto.text} ":  "${_controllerTypeHouse}",
                              'typePayment': _selectedPayment,
                              'numberPhone': widget.form.numeroTelefono,
                              'latitude': _lat.latitude,
                              'longitude': _lat.longitude,
                              'flexible': widget.form.flexible,
                              'userOwner': widget.user.name,
                              'userOwnerID': widget.user.uid,
                              'price' : widget.form.price,
                              'services': widget.form.services
                            }).then((DocumentReference dr) {
                            
                                dr.get().then((DocumentSnapshot snapshot) {

                                  dr.snapshots().listen(onData);

                                  DocumentReference refUsers = Firestore.instance
                                      .collection('users')
                                      .document(widget.user.uid);
                                  refUsers.updateData({
                                    'myOrders': FieldValue.arrayUnion([
                                      Firestore.instance
                                          .document("users/${snapshot.documentID}")
                                    ])
                                  }).then((value) => {
                                    setState(() {
                                    this._selectedPayment = "Tarjeta";
                                  }),
                                      print("Listo")});
                                });
                              });

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.monetization_on),
                    title: Text("Efectivo"),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        this._selectedPayment = "Efectivo";
                      });
                  
                      createAlertDialog(context);
                  
                   
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(60),
                      topRight: const Radius.circular(60))),
            );
          });
    }


   if(_locationData != null){
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
          children: <Widget>[

            // Mapa
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(1.4, 0.3),
                    spreadRadius: 1.0,
                    blurRadius: 15.0
                  )
                ],
                borderRadius: BorderRadius.circular(100)
                ),
                child: new GoogleMap(
                  // liteModeEnabled: true,
                  rotateGesturesEnabled: false,
                  zoomGesturesEnabled: false,
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  markers: markers,
                  initialCameraPosition: CameraPosition(
                    target:  LatLng(_locationData.latitude, _locationData.longitude),
                    zoom: 17,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                  },
                  onTap: (newUbi){
                    setState(() {
                      markers.add(
                      Marker(
                        markerId: MarkerId("yo"),
                        position: newUbi,
                        icon: this.icon
                        )
                    );
                    _lat = newUbi;

                    });
                   
                    _controller.animateCamera(
                        CameraUpdate.newLatLng(
                          newUbi
                        )
                      );
                  },
                ),
              ),
             // Boton
            AnimatedContainer(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top:190),
                    duration: Duration(milliseconds: 400),
                    child: Container(
                      child: ButtonPurple(
                        buttonText: pressBtn ? "Preparando Pago" : "Siguiente",
                        onPressed: ()  {
                        if(busqueda.text != ""){
                            if(isEdifice || isOffice){
                              numPiso.text.length < 1 && dpto.text.length < 1 ? _showSnackBar("Completa tu número de piso y departamento") 
                              : 
                            setState(() {
                              pressBtn = !pressBtn;
                            });
                              _showBottomSheet();
                            }else{
                              _showBottomSheet();
                            }
                        }else {
                          _showSnackBar("Escribe tu dirección en el buscador");
                        }
                        

                        })
                    ),
                  ),
              
            //Tipo de casa
            AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      height: isEdifice || isOffice ? 320 : 160,
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 0, bottom: 2),
                      margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(9.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 7.0))
                          ]
                          ),
                      child: Column(
                        children: <Widget>[

                          
              // Input De busqueda
              Container(
                    padding: EdgeInsets.only(
                          left: 10.0, right: 10.0),
                      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10),
                    decoration: BoxDecoration(
                       boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 7.0))
                          ]
                    ),
                   child: AddressSearchField(
                    controller: busqueda,
                    coordForRef: true,
                     decoration: InputDecoration(
                        hintText: busqueda.text.length == 0 ? "Buscar" : "${busqueda.text}",
                        suffixIcon:  Icon(Icons.location_on),
                        fillColor: Color(0xFFFFFFFF),
                        filled: true,
                        border:  InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                            borderRadius: BorderRadius.all(Radius.circular(12.0))
                        )
                    ),
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 21,
                      fontWeight: FontWeight.bold
                    ),
                    country: "Argentina",
                    city: "Buenos Aires",
                    hintText: "Busca una dirección",
                    noResultsText: "Si no encuentras el lugar pero puedes moverte tocando la pantalla",
                    onDone: (AddressPoint point) {
                      markers.add(
                        Marker(
                        markerId: MarkerId("yo"),
                        position:  LatLng(point.latitude, point.longitude),
                        icon: this.icon
                        )
                      );
                      setState(() {
                        _lat = LatLng(point.latitude, point.longitude);
               
                      });
                      _controller.animateCamera(
                        CameraUpdate.newLatLng(
                          _lat
                        )
                      );
                      Navigator.pop(context);
                    },
                    ),
                 ),
              

                          
              Column(
                children: <Widget>[
                  Text("Selecciona el tipo de vivienda",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  FilterChip(
                                    label: Icon(Icons.home, color: isHose ? Colors.white : Colors.black54),
                                    selected: isHose,
                                    selectedColor: korange,
                                    checkmarkColor: Colors.white,
                                    tooltip: "Casa",
                                    onSelected: (value){
                                      setState(() {
                                        isHose = value;
                                        isEdifice = false;
                                        isOther = false;
                                        isOffice = false;
                                      });
                                      if(isHose){
                                        _controllerTypeHouse = "Casa";
                                      }
                                    }),
                                  FilterChip(
                                    label: Icon(Icons.business, color: isEdifice ? Colors.white : Colors.black54),
                                    elevation: 1,
                                    pressElevation: 10,
                                    selected: isEdifice,
                                    selectedColor: korange,
                                    checkmarkColor: Colors.white,
                                    tooltip: "Edificio",
                                    onSelected: (value){
                                      setState(() {
                                        isHose = false;
                                        isEdifice = value;
                                        isOther = false;
                                        isOffice = false;
                                        _controllerTypeHouse = "Edificio";
                                      });
                                    }),
                                  FilterChip(
                                    label: Icon(Icons.business_center, color: isOffice ? Colors.white : Colors.black54),
                                    selected: isOffice,
                                    tooltip: "Oficina",
                                    selectedColor: korange,
                                    checkmarkColor: Colors.white,
                                    onSelected: (value){
                                      setState(() {
                                        isHose = false;
                                        isEdifice = false;
                                        isOther = false;
                                        isOffice = value;
                                        _controllerTypeHouse = "Oficina";
                                      });
                                    }),
                                  FilterChip(
                                    label: Icon(Icons.more_horiz, color: isOther ? Colors.white : Colors.black54),
                                    selected: isOther,
                                    selectedColor: korange,
                                    checkmarkColor: Colors.white,
                                    tooltip: "Otros",
                                    onSelected: (value){
                                      setState(() {
                                        isHose = false;
                                        isEdifice = false;
                                        isOther = value;
                                        isOffice = false;
                                        _controllerTypeHouse = "Otro";
                                      });
                                    }),
                                ],
                              ),
                ],
              ),
                        
                          isEdifice || isOffice ? 
                            Container(
                              height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                      
                                      TextInputLocation(
                                        hintText: "N° piso",
                                        controller: numPiso,
                                        tipoTeclado: TextInputType.number,
                                        ),
                                 
                                      TextInputLocation(
                                        hintText: "Dpto",
                                        controller: dpto,
                                        // tipoTeclado: TextInputType.number,
                                        ),

                                ],
                              ),
                            )
                            :
                            Container()
                        ],
                      ),
                    ),
          

          
          ]
        ),
    
    );
  
   } else{
     return Scaffold( body: Center(child: CircularProgressIndicator(),),);
   }
  }


  void onData(DocumentSnapshot event) async{
                 
                  if (event.data['preference_id'] != null){
                    var result = MercadoPagoMobileCheckout.startCheckout(
                      'APP_USR-b94e8b02-f5ae-4cf0-9a59-5f676114bd41',
                      event.data['preference_id']
                      );

                      await result.then((value) =>{
                        print(value.result),
                        if(value.result == 'done'){
                         Firestore.instance.collection('orders').document(event.documentID).setData({
                           'state': 'En proceso',
                              'direction': busqueda.text,
                              'recolectionStart': widget.form.fecha,
                              'type': widget.form.type,
                              'description': widget.form.descripcion,
                              'neighborhood': widget.form.barrio,
                              'typeHouse' : _controllerTypeHouse == "Edificio" || _controllerTypeHouse == "Oficina" ? "${_controllerTypeHouse} piso${numPiso.text} dpto.${dpto.text}":  "${_controllerTypeHouse}",
                              'typePayment': _selectedPayment,
                              'numberPhone': widget.form.numeroTelefono,
                              'latitude': _lat.latitude,
                              'longitude': _lat.longitude,
                              'flexible': widget.form.flexible,
                              'userOwner': widget.user.name,
                              'userOwnerID': widget.user.uid,
                              'price' : widget.form.price,
                              'services': widget.form.services
                         }).then((value) => {
                           
                            Navigator.pop(context),
                            Navigator.pop(context),
                            Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => HomeScreen()))
                         }),
                         
                        }else if(value.result == 'canceled'){
                            Navigator.pop(context),
                           Firestore.instance.collection('orders').document(event.documentID).delete()
                        }else {
                          print(value.result)
                        }
                      });
                      
                  }
                }
}

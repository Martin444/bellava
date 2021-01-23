import 'package:address_search_field/address_search_field.dart';
import 'package:bellava/Models/masajes.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/widget/button_purple.dart';
import 'package:bellava/Screens/Delivery/widget/text_input_location.dart';
import 'package:bellava/Screens/Home/home.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Screens/Success/success.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bellava/Models/formInfo.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:location/location.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Maped extends StatefulWidget {
  FormInfo form;
  // User user;

  Maped({
    this.form,
  });

  @override
  _MapedState createState() => _MapedState();
}

class _MapedState extends State<Maped> {
  var controllerServi = Get.find<ServiceController>();

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
    final snackBar = SnackBar(content: Text(text));

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  void initState() {
    _getLocation();
    getIcon();
  }

  getIcon() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), "assets/marker.png");

    setState(() {
      this.icon = icon;
    });
  }

  // Funcion que inicia la busqueda de la ubicacion
  _getLocation() async {
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
          Marker(markerId: MarkerId("yo"), position: _lat, icon: this.icon));
    });
  }

  @override
  Widget build(BuildContext context) {
    _alertPayTarget() {
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
                      center: new Text(
                        "Procesando",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
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
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      progressColor: kceleste1,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  )
                ],
              ),
            );
          });
    }

    //DIalog para el pago en efectivo
    createAlertDialog(BuildContext context) {
      List<Text> servs = new List<Text>();

      widget.form.services.forEach((e) {
        e != null
            ? servs.add(Text(
                e,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Lato'),
              ))
            : null;
      });

      bool can = false;
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                contentPadding: EdgeInsets.all(5),
                // actionsPadding: EdgeInsets.all(5),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                title: Center(
                    child: Text(
                  'Pagar',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                content: Container(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          widget.form.services.length >= 1
                              ? Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left:5, right: 10),
                                        child: SvgPicture.asset(
                                            'assets/icons/clipboard-list.svg',
                                            color: kceleste1),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Servicios',
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Lato'),
                                          ),
                                          Container(
                                            width: 140,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: servs,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  children: <Widget>[],
                                ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left:5, right: 10),
                                child: SvgPicture.asset(
                                    'assets/icons/calendar.svg',
                                    color: kceleste1),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Dia y Hora',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Lato"),
                                  ),
                                  Text(
                                    '${widget.form.fecha}',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Lato"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left:5, right: 10),
                                child: SvgPicture.asset(
                                    'assets/icons/location-marker.svg',
                                    color: kceleste1),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Ubicación',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Lato"),
                                  ),
                                  Container(
                                    width: 170,
                                    child: Text(
                                      '${busqueda.text}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Lato"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left:5, right: 10),
                                child: SvgPicture.asset('assets/icons/home.svg',
                                    color: kceleste1),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Tipo de vivienda',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Lato"),
                                  ),
                                  Container(
                                    // width: 200,
                                    child: Text(
                                      '${_controllerTypeHouse}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Lato"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left:5, right: 10),
                                child: SvgPicture.asset('assets/icons/phone.svg',
                                    color: kceleste1),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Número de teléfono',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Lato"),
                                  ),
                                  Container(
                                    // width: 150,
                                    child: Text(
                                      '${widget.form.numeroTelefono}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Lato"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                "Total a pagar:",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Lato"),
                              ),
                              Text(
                                " ${widget.form.price} Pesos",
                                style: TextStyle(
                                    color: kgreenPrimary,
                                    fontSize: 19,
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
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: FlatButton(
                          color: opacityCeleste2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: 55,
                            child: Center(
                              child: Text(
                                'Cancelar',
                                style: TextStyle(color: kceleste1, fontSize: 21),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      
                      Container(
                        // width: 180,
                        child: FloatNext(
                          text: 'Confirmar',
                          iconData: Icons.arrow_forward,
                          onChanged: () {
                            controllerServi.payWhitEffective(
                                widget.form,
                                _controllerTypeHouse,
                                numPiso.text,
                                busqueda.text,
                                _selectedPayment,
                                _lat.latitude,
                                _lat.longitude);
                          },
                        ),
                      ),
                    ],
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
              height: 145,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        'Selecciona el método de pago',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/icons/credit-card.svg',
                        color: kceleste1),
                    title: Text(
                      'Tarjeta de Crédito o Débito',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                    ),
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
                        'typeHouse': _controllerTypeHouse == "Edificio" ||
                                _controllerTypeHouse == "Oficina"
                            ? "${_controllerTypeHouse} piso ${numPiso.text} dpto.${dpto.text} "
                            : "${_controllerTypeHouse}",
                        'typePayment': _selectedPayment,
                        'numberPhone': widget.form.numeroTelefono,
                        'latitude': _lat.latitude,
                        'longitude': _lat.longitude,
                        'flexible': widget.form.flexible,
                        // 'userOwner': widget.user.name,
                        // 'userOwnerID': widget.user.uid,
                        'price': widget.form.price,
                        'services': widget.form.services
                      }).then((DocumentReference dr) {
                        dr.get().then((DocumentSnapshot snapshot) {
                          dr.snapshots().listen(onData);

                          DocumentReference refUsers = Firestore.instance
                              .collection('users')
                              .document(controllerServi.user.uid);
                          refUsers.updateData({
                            'myOrders': FieldValue.arrayUnion([
                              Firestore.instance
                                  .document("users/${snapshot.documentID}")
                            ])
                          }).then((value) => {
                                setState(() {
                                  this._selectedPayment = "Tarjeta";
                                }),
                                print("Listo")
                              });
                        });
                      });
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/icons/cash.svg',
                        // fit: BoxFit.none,
                        // width: 5,
                        color: kceleste1),
                    title: Text(
                      'En efectivo',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _selectedPayment = 'Efectivo';
                      });

                      createAlertDialog(context);
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20))),
            );
          });
    }

    if (_locationData != null) {
      return GetBuilder<ServiceController>(
        builder: (_) => Scaffold(
          backgroundColor: Colors.grey[200],
          key: _scaffoldKey,
          body: SafeArea(
            
            child: Stack(
              children: <Widget>[
              // Mapa
              Container(
                margin: EdgeInsets.only(top:250),
                alignment: Alignment.bottomCenter,
                height: 400,
                decoration: BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(1.4, 0.3),
                      spreadRadius: 1.0,
                      blurRadius: 17.0)
                ], borderRadius: BorderRadius.circular(100)),
                child: new GoogleMap(
                  // liteModeEnabled: true,
                  rotateGesturesEnabled: false,
                  zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  markers: markers,
                  initialCameraPosition: CameraPosition(
                    bearing: 90,
                    tilt: 50.0,
                    target:
                        LatLng(_locationData.latitude, _locationData.longitude),
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  onTap: (newUbi) {
                    setState(() {
                      markers.add(Marker(
                          markerId: MarkerId("yo"),
                          position: newUbi,
                          icon: this.icon));
                      _lat = newUbi;
                    });

                    _controller.animateCamera(CameraUpdate.newLatLng(newUbi));
                  },
                ),
              ),

              AnimatedContainer(
                alignment: AlignmentDirectional.bottomCenter,
                duration: Duration(seconds: 2),
                child: Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Total a pagar',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700)),
                              Text('${widget.form.price} Pesos',
                                  style: TextStyle(
                                      color: Color(0xff77D499),
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                      FloatNext(
                        text: 'Siguiente',
                        iconData: Icons.arrow_forward,
                        onChanged: () {
                          if (busqueda.text != "") {
                            if (isEdifice || isOffice) {
                              numPiso.text.isEmpty
                                  ? _showSnackBar(
                                      "Completa tu número de piso y departamento")
                                  : setState(() {
                                      pressBtn = !pressBtn;
                                    });
                              _showBottomSheet();
                            } else {
                              _showBottomSheet();
                            }
                          } else {
                            _showSnackBar('Escribe tu dirección en el buscador');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),

              //Tipo de casa
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                height: isEdifice || isOffice ? 250 : 175,
                padding: EdgeInsets.only(top: 0, bottom: 2),
                margin: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 7.0))
                    ]),
                child: Column(
                  children: <Widget>[
                    // Input De busqueda
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: AddressSearchField(
                        controller: busqueda,
                        coordForRef: true,
                        decoration: InputDecoration(
                            hintText: busqueda.text.length == 0
                                ? "Buscar"
                                : "${busqueda.text}",
                            suffixIcon: SvgPicture.asset(
                                'assets/icons/location-marker.svg',
                                fit: BoxFit.none,
                                width: 5,
                                color: Colors.blueGrey),
                            fillColor: opacityCeleste2,
                            filled: true,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)))),
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                        country: "Argentina",
                        city: "Buenos Aires",
                        hintText: "Busca una dirección",
                        noResultsText:
                            "Si no encuentras el lugar pero puedes moverte tocando la pantalla",
                        onDone: (BuildContext dialogContext, AddressPoint point) {
                          markers.add(Marker(
                              markerId: MarkerId("yo"),
                              position: LatLng(point.latitude, point.longitude),
                              icon: this.icon));
                          setState(() {
                            _lat = LatLng(point.latitude, point.longitude);
                          });
                          _controller.animateCamera(CameraUpdate.newLatLng(_lat));
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    Column(
                      children: <Widget>[
                        Text(
                          '¿Como es tu vivienda?',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        //Barrio
                        Container(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 2, bottom: 2),
                          // margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                            color: opacityCeleste2,
                            borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            // boxShadow: <BoxShadow>[
                            //   BoxShadow(
                            //       color: Colors.black12,
                            //       blurRadius: 15.0,
                            //       offset: Offset(0.0, 7.0))
                            // ]
                          ),
                          child: DropdownButton<String>(
                              underline: Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Colors.white))),
                              ),
                              value: _controllerTypeHouse,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 26,
                              ),
                              hint: Container(
                                padding: EdgeInsets.only(top: 18),
                                // margin: EdgeInsets.only(right: 5),
                                height: MediaQuery.of(context).size.height / 11,
                                width: MediaQuery.of(context).size.width / 1.50,
                                child: Text(
                                  'Selecciona tu Barrio',
                                  style: TextStyle(
                                    fontSize: 19.0,
                                    fontFamily: "Lato",
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              items: <String>[
                                'Casa',
                                'Edificio',
                                'Oficina',
                                'Otro',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      Text(
                                        value,
                                        style: TextStyle(
                                            fontSize: 19.0,
                                            fontFamily: 'Lato',
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Icon( isOffice || isEdifice ? Icons.location_city: Icons.home),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                setState(() {
                                  _controllerTypeHouse = value;
                                });

                                switch (_controllerTypeHouse) {
                                  case 'Oficina':
                                    setState(() {
                                      isOffice = true;
                                      isEdifice = false;
                                    });
                                    break;
                                  case 'Edificio':
                                    setState(() {
                                      isOffice = false;
                                      isEdifice = true;
                                    });
                                    break;

                                  case 'Casa':
                                    setState(() {
                                      isOffice = false;
                                      isEdifice = false;
                                    });
                                    break;
                                  case 'Otro':
                                    setState(() {
                                      isOffice = false;
                                      isEdifice = false;
                                    });
                                    break;
                                  default:
                                }
                              }),
                        ),
                      ],
                    ),

                    isEdifice || isOffice
                        ? Container(
                            // height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(
                                  height: 15,
                                ),
                                TextInputLocation(
                                  hintText: 'Piso y departamento',
                                  controller: numPiso,
                                  tipoTeclado: TextInputType.text,
                                ),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              ),

              // BarTop
              SafeArea(
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Container(
                        width: Get.width,
                        height: 90,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Ubicación',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        child: FlatButton(
                          child: Center(
                              child: Icon(
                            Icons.arrow_back,
                            color: Colors.black87,
                          )),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  void onData(DocumentSnapshot event) async {
    if (event.data['preference_id'] != null) {
      var result = MercadoPagoMobileCheckout.startCheckout(
          'APP_USR-b94e8b02-f5ae-4cf0-9a59-5f676114bd41',
          event.data['preference_id']);

      await result.then((value) => {
            print(value.result),
            if (value.result == 'done')
              {
                Firestore.instance
                    .collection('orders')
                    .document(event.documentID)
                    .setData({
                  'state': 'En proceso',
                  'direction': busqueda.text,
                  'recolectionStart': widget.form.fecha,
                  'type': widget.form.type,
                  'description': widget.form.descripcion,
                  'neighborhood': widget.form.barrio,
                  'typeHouse': _controllerTypeHouse == "Edificio" ||
                          _controllerTypeHouse == "Oficina"
                      ? "${_controllerTypeHouse} piso${numPiso.text} dpto.${dpto.text}"
                      : "${_controllerTypeHouse}",
                  'typePayment': _selectedPayment,
                  'numberPhone': widget.form.numeroTelefono,
                  'latitude': _lat.latitude,
                  'longitude': _lat.longitude,
                  'flexible': widget.form.flexible,
                  // 'userOwner': widget.user.name,
                  // 'userOwnerID': widget.user.uid,
                  'price': widget.form.price,
                  'services': widget.form.services
                }).then((value) => {
                          Navigator.pop(context),
                          Navigator.pop(context),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()))
                        }),
              }
            else if (value.result == 'canceled')
              {
                Navigator.pop(context),
                Firestore.instance
                    .collection('orders')
                    .document(event.documentID)
                    .delete()
              }
            else
              {print(value.result)}
          });
    }
  }
}

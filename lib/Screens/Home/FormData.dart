import 'package:flutter/material.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/Delivery/widget/text_input_location.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bellava/Screens/Delivery/widget/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:bellava/Screens/Delivery/widget/button_purple.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bellava/Screens/controllers/Service_controller.dart';

class FormData extends StatefulWidget {


  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {

  String _controllerBarrioOrder;
     @override
  void initState() {
    _getLocation();
    getIcon();
  }
  final _controllerDirectionPlace = TextEditingController();
  final _controllerLocationOrder = TextEditingController();
  final _controllerPhoneNumber = TextEditingController();

  GoogleMapController _controller;
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

   Set<Marker> markers = Set();
   LocationData _locationData;
   LatLng _lat = LatLng(0.0, 0.0);
   BitmapDescriptor icon;



  getIcon() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/marker.png');

    setState(() {
      this.icon = icon;
    });
  }

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

  var user =  Get.find<ServiceController>();

    if(_locationData != null){

      return Scaffold(
        body: Stack(
          children: [
            BackGradient(),
            Container(
              padding: EdgeInsets.symmetric(horizontal:10, vertical: 15),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Text('Completa estos datos para continuar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    // Barrio
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2, bottom: 5),
                              margin: EdgeInsets.only(top: 20.0),
                              decoration: BoxDecoration(
                                color: opacityCeleste2,
                                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                              ),
                              child: DropdownButton<String>(
                                  underline: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                      bottom: BorderSide(color: Colors.white))),
                                  ),
                                  value: _controllerBarrioOrder == null
                                      ? null
                                      : _controllerBarrioOrder,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 26,
                                  ),
                          hint: Container(
                            padding: EdgeInsets.only(top: 12, bottom: 10),
                            margin: EdgeInsets.only(right: 5),
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 1.35,
                            child: Text(
                              "Selecciona tu Barrio",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: "Lato",
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          items: <String>[
                            'Almagro',
                            'Belgrano',
                            'Balvanera',
                            'Colegiales',
                            'La Plata',
                            'Monserrat',
                            'Pto Madero',
                            'Palermo',
                            'Recoleta',
                            'Retiro',
                            'San Nicolás',
                            'Villa Crespo'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 19.0,
                                    fontFamily: "Lato",
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _controllerBarrioOrder = value;
                            });
                          }),
                    ),
                          

                          ]

                        
                        ),
                      ),
                    // Telefono
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: TextInputLocation(
                          controller: _controllerPhoneNumber,
                          hintText: 'Teléfono de contacto',
                          iconData: SvgPicture.asset('assets/icons/phone.svg',
                              fit: BoxFit.none, width: 5, color: Colors.blueGrey),
                          tipoTeclado: TextInputType.number,
                        ),
                      ),
                    
                    // Telefono
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: TextInputLocation(
                          controller:_controllerDirectionPlace,
                          hintText: 'Dirección',
                          iconData: SvgPicture.asset('assets/icons/location-marker.svg',
                              fit: BoxFit.none, width: 5, color: Colors.blueGrey),
                          tipoTeclado: TextInputType.text,
                        ),
                      ),
                    
                    // Location
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(top:20, bottom: 20),
                            alignment: Alignment.bottomCenter,
                            height: 300,
                            decoration: BoxDecoration(
                              boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.4, 0.3),
                                  spreadRadius: 1.0,
                                  blurRadius: 20.0)
                            ], ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: GoogleMap(
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
                          ),
                      ),

                      Container(
                        width: Get.width,
                        height: 50,
                        child: ButtonPurple(
                          buttonText: 'Confirmar',
                          onPressed: (){
                            if(_controllerBarrioOrder == null){
                              Get.dialog(AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error_outline, color: Colors.redAccent),
                                    Text('Lo siento')
                                  ],
                                ),
                                content: Text(
                                  'Selecciona uno de los barrios disponibles',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 19, color: Colors.blueGrey),
                                ),
                                actions: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                     
                                      FlatButton(
                                        shape:
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        textColor: Colors.white,
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              'Aceptar',
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        color: Color(0xff77D499),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ));
                            
                            } else {
                              if(_controllerPhoneNumber.text.length < 2 ){
                                Get.dialog(AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error_outline, color: Colors.redAccent),
                                    Text('Ups!')
                                  ],
                                ),
                                content: Text(
                                  'Tu número de teléfono en necesario para que el profesional se comunique con vos',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 19, color: Colors.blueGrey),
                                ),
                                actions: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                     
                                      FlatButton(
                                        shape:
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        textColor: Colors.white,
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              'Aceptar',
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        color: Color(0xff77D499),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ));
                            
                              } else{
                                Firestore.instance.collection('users').document(user.user.uid).setData({
                                  'phoneNumber': _controllerPhoneNumber.text,
                                  'adress' : _controllerDirectionPlace.text,
                                  'latitude' : _lat.latitude,
                                  'longitude' : _lat.longitude,
                                  'barrio' : _controllerBarrioOrder
                                }, merge: true).then((value) => {
                                  Get.dialog(AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    title: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.error_outline, color: Colors.redAccent),
                                        Text('Listo!')
                                      ],
                                    ),
                                    content: Text(
                                      'Ahora tus pedidos serán mucho más rápido',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 19, color: Colors.blueGrey),
                                    ),
                                    actions: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        
                                          FlatButton(
                                            shape:
                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            textColor: Colors.white,
                                            child: Container(
                                              width: 120,
                                              height: 40,
                                              child: Center(
                                                child: Text(
                                                  'Aceptar',
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            color: Color(0xff77D499),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                            
                                });
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
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
}
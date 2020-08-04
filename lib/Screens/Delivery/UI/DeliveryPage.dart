import 'package:bellava/Bloc/user_bloc.dart';
import 'package:bellava/Models/masajes.dart';
import 'package:bellava/Models/orders.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/widget/SelectDateTime.dart';
import 'package:bellava/Screens/Delivery/widget/button_purple.dart';
import 'package:bellava/Screens/Delivery/widget/map.dart';
import 'package:bellava/Screens/Delivery/widget/text_input.dart';
import 'package:bellava/Screens/Delivery/widget/text_input_location.dart';
import 'package:bellava/Screens/Home/widget/profileHeader.dart';
import 'package:bellava/Screens/Success/success.dart';
import 'package:bellava/Utils/button_green.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bellava/Models/formInfo.dart';

import 'package:intl/intl.dart';
import 'package:location/location.dart';
// import 'package:latlong/latlong.dart';

class DeliveryPage extends StatefulWidget {

  User user;
  FormInfo form;

  DeliveryPage({Key key, this.user, this.form});

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {

  // Variables para la localizacion
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  var lat;

  @override
  void initState() {

    _getLocation();
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

              //  await location.onLocationChanged.listen((LocationData event){
              //    if(_locationData == null){
              //      print(_locationData);
                    
              //    }
              // });

              _locationData = await location.getLocation();

              setState(() {
                lat = LatLng(_locationData.latitude, _locationData.longitude);
              });
              print(lat);
  }


  final format = DateFormat("dd/mm/yyyy");
  final timeFormat = DateFormat('hh:mm');
  String _controllerBarrioOrder;
  final _controllerDescriptionPlace =  TextEditingController();
  final _controllerLocationOrder = TextEditingController();
  final _controllerPhoneNumber =  TextEditingController();
  final _controllerCupo =  TextEditingController();


  String _selectedPayment = "";
 

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _showSnackBar(text) {
    final snackBar =  SnackBar(content: Text(text));

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


   
    _showBottomSheet(newTotal) {
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
                      setState(() {
                        this._selectedPayment = "Tarjeta";
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
                      // createAlertDialog(context, newTotal);
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

    _showButtonSheeetMap(){
        return showBottomSheet(
          
          builder: (BuildContext context) {
            return Container(
              child: SingleChildScrollView(

                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          "Selecciona el lugar",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    //Aplicar mapa googleMaps
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        
                      ),
                      height: 240,
                      child: Maped(),
                    ),

                    ButtonGreen(
                     text: "Listo!",
                     onPressed: (){
                       Navigator.pop(context);
                       _showBottomSheet(widget.form.price);
                     },
                     height: 50,
                    )

                  
                  ],
                ),
               
              ),
            );
          });
    }

    //Esto muestra el dialog del descuento aplicado
    showAlertDescuento(BuildContext context, num descuento) {
      var newTotal = widget.form.price - descuento;
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              title: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text('¡Cupón aplicado con Éxito!')),
              ),
              content: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Total Anterior: "),
                        Text("${widget.form.price} Pesos"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Descuento: ",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("$descuento Pesos",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Nuevo total:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " $newTotal Pesos",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Firestore.instance
                          .collection('users')
                          .document(widget.user.uid)
                          .updateData({
                        "cupo": FieldValue.arrayUnion([_controllerCupo.text])
                      });
                         var info = FormInfo(
                                      fecha: "",
                                      descripcion: _controllerDescriptionPlace.text,
                                      flexible: false,
                                      calle: "",
                                      barrio: _controllerBarrioOrder,
                                      vivienda: "",
                                      numeroTelefono: _controllerPhoneNumber.text,
                                      services: widget.form.services,
                                      price: newTotal,
                                      type: widget.form.type
                                    );
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return DateSelect(info: info,
                                user: widget.user,
                            
                                );
                              }));
                    
                    },
                    child: Text("Continuar"))
              ],
            );
          });
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          ProfileHeader(2),
          
          Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
      
               //Detalles
                TextInput(
                  hintText:
                      "Agrega aquí: cualquier información, detalle o cuidado especial que necesites",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace,
                ),
              

               
                //Barrio
                Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 2, bottom: 2),
                  margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 7.0))
                      ]),
                  child: new DropdownButton<String>(
                      underline: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white))),
                      ),
                      value: _controllerBarrioOrder == null
                          ? null
                          : _controllerBarrioOrder,
                      icon: Icon(Icons.location_city),
                      hint: Container(
                        padding: EdgeInsets.only(top: 18),
                        margin: EdgeInsets.only(right: 5),
                        height: MediaQuery.of(context).size.height / 11,
                        width: MediaQuery.of(context).size.width / 1.35,
                        child: Text(
                          "Selecciona tu Barrio",
                          style: TextStyle(
                            fontSize: 15.0,
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
                                fontSize: 15.0,
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


                //Numero de telefono
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                      controller: _controllerPhoneNumber,
                      hintText: "Teléfono",
                      iconData: Icons.phone,
                      tipoTeclado: TextInputType.number,
                      ),
                ),
                
                //Cupon
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                      controller: _controllerCupo,
                      hintText: "Cupón promocional",
                      iconData: Icons.local_offer),
                ),
               
                //Button
                Container(
                  child: ButtonPurple(
                    buttonText: "Siguiente",
                    onPressed: () async {
                      // showAlertDescuento(context, 300);
                        
                      if(_controllerPhoneNumber.text.isNotEmpty && _controllerBarrioOrder  != null){

                          if (_controllerCupo.text.length >= 1) {
                                //Verifiamos que el cupón existe en la base de datos del usuario
                                _showSnackBar("Verificando código");
                               Firestore.instance.collection('users').document(widget.user.uid).get().then((value) {
                                        var cupo =   value.data['cupo'].indexOf(_controllerCupo.text);
                                        print(value.data['cupo']);

                                              if(cupo != null){
                                                    cupo == -1 ?
                                                            //Ahora tenemos que verificar si el cupon esta disponible para usar             
                                                            Firestore.instance.collection('cupones').document('${_controllerCupo.text}').get().then((data) {
                                                                          Firestore.instance.collection('users').document(widget.user.uid).updateData({
                                                                            'cupo' : FieldValue.arrayUnion([_controllerCupo.text])
                                                                          });
                                                        

                                                                      var dataCupo = data.data['isused'];
                                                                      var descuento = data.data['desc'];
                                                                      print(dataCupo);
                                                                      if(dataCupo){
                                                                        //Aplicamos el descuento
                                                                        var apli =
                                                                            widget.form.price - descuento;
                                                                      showAlertDescuento(context, descuento);
                                                                      } else {
                                                                        var apli =
                                                                            widget.form.price - descuento;
                                                                            showAlertDescuento(context, apli);
                                                                        // _showSnackBar(
                                                                        //         "Este código no está disponible");
                                                                      }
                                                                        }).catchError((e)=> _showSnackBar(
                                                                                "Este código no está disponible"))
                                                        :
                                                            _showSnackBar(
                                                            "Ya usaste este código");

                                              }


                                });


                      

                          } else {
                            var info2 = FormInfo(
                                  fecha: "",
                                  descripcion: _controllerDescriptionPlace.text,
                                  flexible: false,
                                  calle: "",
                                  barrio: _controllerBarrioOrder,
                                  vivienda: "",
                                  numeroTelefono: _controllerPhoneNumber.text,
                                  services: widget.form.services,
                                  price: widget.form.price,
                                  type: widget.form.type
                                );
                                Navigator.pop(context);
                                  await Navigator.push(context, MaterialPageRoute(builder: (_) {
                                      return DateSelect(info: info2,
                                        user: widget.user,
                                      );
                                    }));
                                    // _showButtonSheeetMap();
                          }

                          }else {
                            _showSnackBar("Procura rellenar todos los campos");
                            }
                    },
                  ),
                ),
             
             ],
            ),
          ),
        
          Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFB78DD9),
                  ),
                  padding: EdgeInsets.only(top: 38.0),
                  child: Text(
                    "Detalles de tu solicitud",
                    style: TextStyle(
                        color: kwhite,
                        fontSize: 21,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        
        ],
      ),
    );
  }

}
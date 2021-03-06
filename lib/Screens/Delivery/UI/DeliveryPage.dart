import 'package:bellava/Screens/Delivery/widget/SelectDateTime.dart';
import 'package:bellava/Screens/Delivery/widget/map.dart';
import 'package:bellava/Screens/Delivery/widget/text_input.dart';
import 'package:bellava/Screens/Delivery/widget/text_input_location.dart';
import 'package:bellava/Screens/Home/widget/CardUserInfo.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/button_green.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bellava/Models/formInfo.dart';

import 'package:intl/intl.dart';
import 'package:location/location.dart';
// import 'package:latlong/latlong.dart';

class DeliveryPage extends StatefulWidget {
  // User user;
  FormInfo form;

  // Servicio extra para cuando se seleciona un profesional y dejar el actual como un default en caso de que no se seleccione un profesional

  // Agregar una nueva pantalla en donde se pueda seleccionar un profesional (Como se marca en el Word)

  // agregar los nuevos inputs cuando se crea al profesional

  // Investigar

  DeliveryPage({Key key, this.form});

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  var userDatax = Get.find<ServiceController>();
  // Variables para la localizacion
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  var lat;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  // Funcion que inicia la busqueda de la ubicacion
  void _getLocation() async {
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
  final _controllerDescriptionPlace = TextEditingController();
  final _controllerLocationOrder = TextEditingController();
  final _controllerPhoneNumber = TextEditingController();
  final _controllerCupo = TextEditingController();

  String _selectedPayment = "";

  bool mydat = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showSnackBar(text) {
    final snackBar = SnackBar(content: Text(text));

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _showBottomSheet(newTotal) async {
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

    _showButtonSheeetMap() {
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
                          'Selecciona el lugar',
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
                      decoration: BoxDecoration(),
                      height: 240,
                      child: Maped(),
                    ),

                    ButtonGreen(
                      text: "Listo!",
                      onPressed: () {
                        Navigator.pop(context);
                        _showBottomSheet(widget.form.price);
                      },
                      height: 50,
                    )
                  ],
                ),
              ),
            );
          },
          context: context);
    }

    //Esto muestra el dialog del descuento aplicado
    showAlertDescuento(BuildContext context, num descuento) {
      var newTotal = widget.form.price - descuento;
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, color: Colors.greenAccent),
                  Text('Cupón aplicado')
                ],
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
                        Text("Antes del cupón:"),
                        Text("${widget.form.price} Pesos"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Ahorrado: ",
                          style: TextStyle(
                              color: Color(0xff77D499),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$descuento Pesos",
                          style: TextStyle(
                              color: Color(0xff77D499),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Despues del cupón: ",
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
                GetBuilder<ServiceController>(
                  builder: (_) => FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Firestore.instance
                          .collection('users')
                          .document(_.user.uid)
                          .updateData({
                        'cupo': FieldValue.arrayUnion([_controllerCupo.text])
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
                          type: widget.form.type);
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DateSelect(
                          info: info,
                        );
                      }));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    textColor: Colors.white,
                    child: Container(
                      width: 140,
                      height: 45,
                      child: Center(
                        child: Text(
                          'Continuar',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    color: Color(0xff77D499),
                  ),
                )
              ],
            );
          });
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          BackGradient(),
          Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                //Detalles
                TextInput(
                  hintText:
                      'Por favor, detalla aquí cualquier información que creas necesaria',
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace,
                ),

                //Barrio
                Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 2, bottom: 5),
                  margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
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
                      value: _controllerBarrioOrder == null
                          ? null
                          : _controllerBarrioOrder,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 26,
                      ),
                      hint: Container(
                        padding: EdgeInsets.only(top: 18, bottom: 10),
                        margin: EdgeInsets.only(right: 5),
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 1.35,
                        child: Text(
                          "Selecciona tu Barrio",
                          style: TextStyle(
                            fontSize: 19.0,
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
                                fontSize: 21.0,
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

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      //Numero de telefono
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: TextInputLocation(
                          controller: _controllerPhoneNumber,
                          hintText: 'Teléfono de contacto',
                          iconData: SvgPicture.asset('assets/icons/phone.svg',
                              fit: BoxFit.none,
                              width: 5,
                              color: Colors.blueGrey),
                          tipoTeclado: TextInputType.number,
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'O continuar con tus datos',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                mydat = !mydat;
                              });
                            },
                            child: CardUserInfo(
                              user: userDatax.user,
                              select: mydat,
                            ),
                          ),
                        ],
                      ),

                      //Cupon
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: TextInputLocation(
                          controller: _controllerCupo,
                          hintText: 'Cupón de descuento',
                          iconData: SvgPicture.asset('assets/icons/tag.svg',
                              fit: BoxFit.none,
                              width: 5,
                              color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 130)
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
                      'Detalles de la solicitud',
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

          AnimatedContainer(
            alignment: AlignmentDirectional.bottomCenter,
            duration: Duration(seconds: 2),
            child: Container(
              alignment: AlignmentDirectional.bottomCenter,
              height: 95,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(22))),
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
                  GetBuilder<ServiceController>(
                    builder: (_) => Container(
                      width: 190,
                      child: FloatNext(
                        text: 'Siguiente',
                        iconData: Icons.arrow_forward,
                        onChanged: () async {
                          if (_controllerPhoneNumber.text.isNotEmpty &&
                                  _controllerBarrioOrder != null ||
                              mydat) {
                            if (_controllerCupo.text.length >= 1) {
                              //Verifiamos que el cupón existe en la base de datos del usuario
                              _showSnackBar('Verificando código');
                              Firestore.instance
                                  .collection('users')
                                  .document(_.user.uid)
                                  .get()
                                  .then((value) {
                                var cupo = value.data['cupo']
                                    .indexOf(_controllerCupo.text);
                                print(value.data['cupo']);

                                if (cupo != null) {
                                  cupo == -1
                                      ?
                                      //Ahora tenemos que verificar si el cupon esta disponible para usar
                                      Firestore.instance
                                          .collection('cupones')
                                          .document('${_controllerCupo.text}')
                                          .get()
                                          .then((data) {
                                          Firestore.instance
                                              .collection('users')
                                              .document(_.user.uid)
                                              .updateData({
                                            'cupo': FieldValue.arrayUnion(
                                                [_controllerCupo.text])
                                          });

                                          var dataCupo = data.data['isused'];
                                          var datatype = data.data['type'];
                                          var descuento = data.data['desc'];
                                          print(dataCupo);
                                          if (dataCupo) {
                                            //Aplicamos el descuento
                                            var apli =
                                                widget.form.price - descuento;
                                            showAlertDescuento(
                                                context, descuento);
                                          } else {
                                            var apli =
                                                widget.form.price - descuento;
                                            showAlertDescuento(context, apli);
                                            // _showSnackBar(
                                            //         "Este código no está disponible");
                                          }
                                        }).catchError(
                                          (e) => _showSnackBar(
                                              "Este código no está disponible"),
                                        )
                                      : _showSnackBar("Ya usaste este código");
                                }
                              });
                            } else {
                              var info2 = FormInfo(
                                fecha: widget.form.fecha,
                                descripcion: _controllerDescriptionPlace.text,
                                flexible: widget.form.flexible,
                                calle: mydat ? _.user.adress : '',
                                barrio: mydat
                                    ? _.user.barrio
                                    : _controllerBarrioOrder,
                                vivienda: mydat ? _.user.barrio : '',
                                numeroTelefono: mydat
                                    ? _.user.phoneNumber
                                    : _controllerPhoneNumber.text,
                                services: widget.form.services,
                                price: widget.form.price,
                                type: widget.form.type,
                              );

                              _.showBottomSheet(info2);

                              // _showButtonSheeetMap();
                            }
                          } else {
                            _showSnackBar('Procura rellenar todos los campos');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

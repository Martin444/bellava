import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/notification.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Home/home.dart';
import 'package:bellava/Screens/Home/widget/CardUserInfo.dart';
import 'package:bellava/Screens/Home/widget/eyebrow.dart';
import 'package:bellava/Screens/Home/widget/face_tabs.dart';
import 'package:bellava/Screens/Home/widget/manicure.dart';
import 'package:bellava/Screens/Home/widget/manicureandpedicure.dart';
import 'package:bellava/Screens/Home/widget/masaje.dart';
import 'package:bellava/Screens/Home/widget/pedicure.dart';
import 'package:bellava/Screens/Notifications/UI/NotificationPage.dart';
import 'package:bellava/Screens/Notifications/widget/notificationTiles.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bellava/Screens/Home/init.dart';
import 'package:bellava/Screens/Home/FormData.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ServiceController extends GetxController {
  User _user;
  bool _loadState = true;
  String _url;
  int _star = 0;
  int get star => _star;
  Widget _pageDecide = Scaffold(
    body: Center(
      child: LinearProgressIndicator(),
    ),
  );
  Widget get pageDecide => _pageDecide;

  List<Notificatione> notificatione;

  final List<NotificationTiles> _notis = [];
  List<NotificationTiles> get notis => _notis;

  User get user => _user;
  bool get load => _loadState;
  String get url => _url;

  // Esta funcion le pide que decida entre sus datos o nuevos actual
  void selectDataUserOrder(FormInfo form) {
    print(form.type);
    Get.bottomSheet(
      Container(
        height: 250,
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              '¿Querés continuar con tus datos?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.back();
                showBottomSheet(form);
              },
              child: CardUserInfo(
                user: _user,
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                // width: 80,
                height: 45,
                child: Center(
                  child: Text(
                    'Ingresar nuevos datos',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: kceleste1),
                  ),
                ),
              ),
              color: opacityCeleste2,
              onPressed: () {
                Get.back();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
  // Esta funcion le va a preguntar si quiere pagar con efectivo o tarjetas

  void showBottomSheet(FormInfo form) {
    Get.bottomSheet(Container(
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
              alertPayTarget();

              Firestore.instance.collection('orders').add({
                'state': 'A pagar',
                'direction': _user.adress,
                'recolectionStart': form.fecha,
                'type': form.type,
                'description': form.descripcion,
                'neighborhood': _user.barrio,
                'typeHouse': _user.adress,
                'typePayment': 'Tarjeta',
                'numberPhone': _user.phoneNumber,
                'latitude': _user.latitlude,
                'longitude': _user.longitude,
                'flexible': form.flexible,
                'userOwner': _user.name,
                'userEmail': _user.email,
                'userOwnerID': _user.uid,
                'price': form.price,
                'services': form.services
              }).then((DocumentReference dr) {
                dr.get().then((DocumentSnapshot snapshot) {
                  dr.snapshots().listen(onData);

                  DocumentReference refUsers = Firestore.instance
                      .collection('users')
                      .document(_user.uid);
                  refUsers.updateData({
                    'myOrders': FieldValue.arrayUnion([
                      Firestore.instance
                          .document("users/${snapshot.documentID}")
                    ])
                  }).then((value) => {print("Listo")});
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
              // setState(() {
              //   _selectedPayment = 'Efectivo';
              // });
              Get.back();

              alertDialogEfective(form);

              // createAlertDialog(context);
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20))),
    ));
  }

  // Esta funcion se ejecuta si paga con tarjetas

  void alertPayTarget() {
    Get.bottomSheet(Container(
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
    ));
  }

  // Esta funcion se ejecuta cuando la orden se sube e integra el pago

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
                }, merge: true).then((value) =>
                        {Get.back(), Get.back(), Get.to(HomeScreen())}),
              }
            else if (value.result == 'canceled')
              {
                Get.back(),
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

  //DIalog para el pago en efectivo
  void alertDialogEfective(FormInfo form) {
    var servs = <Text>[];

    form.services.forEach((e) {
      e != null
          ? servs.add(Text(
              '${e['service']} x${e['count']}',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Lato'),
            ))
          : null;
    });

    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(5),
      // actionsPadding: EdgeInsets.all(5),
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                form.services.length >= 1
                    ? Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: SvgPicture.asset(
                                  'assets/icons/clipboard-list.svg',
                                  color: kceleste1),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  width: 190,
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
                      padding: EdgeInsets.only(left: 5, right: 10),
                      child: SvgPicture.asset('assets/icons/calendar.svg',
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
                          '${form.fecha}',
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
                      padding: EdgeInsets.only(left: 5, right: 10),
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
                            '${_user.adress}',
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
                      padding: EdgeInsets.only(left: 5, right: 10),
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
                            'Casa',
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
                      padding: EdgeInsets.only(left: 5, right: 10),
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
                            '${_user.phoneNumber}',
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
                      " ${form.price} Pesos",
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
                      style: TextStyle(color: kceleste1, fontSize: 19),
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              // width: 180,
              child: FloatNext(
                text: 'Confirmar',
                iconData: Icons.arrow_forward,
                onChanged: () {
                  payWhitEffective(
                    form,
                    'casa',
                    '2',
                    'a',
                    'Efectivo',
                    _user.latitlude,
                    _user.longitude,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ));
  }

  void selectStar(int select) {
    _star = select;
    update();
  }

  void sendFeedback(String uid) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, color: Colors.greenAccent),
          Text(
            'Genial',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      content: Text(
        'Tu opinión nos ayuda a mejorar',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 21, color: Colors.blueGrey),
      ),
      actions: [
        FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            width: 80,
            height: 45,
            child: Center(
              child: Text(
                'Cancelar',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff77D499)),
              ),
            ),
          ),
          color: opacityCeleste2,
          onPressed: () {
            Get.back();
          },
        ),
        FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textColor: Colors.white,
          child: Container(
            width: 140,
            height: 45,
            child: Center(
              child: Text(
                'Confirmar',
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
            Get.back();
            Get.back();

            switch (_star) {
              case 1:
                Firestore.instance
                    .collection('orders')
                    .document(uid)
                    .updateData({
                  'stars': [true, false, false, false, false]
                });
                break;
              case 2:
                Firestore.instance
                    .collection('orders')
                    .document(uid)
                    .updateData({
                  'stars': [true, true, false, false, false]
                });
                break;
              case 3:
                Firestore.instance
                    .collection('orders')
                    .document(uid)
                    .updateData({
                  'stars': [true, true, true, false, false]
                });
                break;
              case 4:
                Firestore.instance
                    .collection('orders')
                    .document(uid)
                    .updateData({
                  'stars': [true, true, true, true, false]
                });
                break;
              case 5:
                Firestore.instance
                    .collection('orders')
                    .document(uid)
                    .updateData({
                  'stars': [
                    true,
                    true,
                    true,
                    true,
                    true,
                  ]
                });
                break;
              default:
            }
          },
        )
      ],
    ));
  }

  void goToNotifications() {
    Get.to(Notifications(), transition: Transition.cupertino);
    setDataNotifications();
  }

  void readNotifications(String uid) {
    Firestore.instance
        .collection('notification')
        .document(uid)
        .updateData({'read': true}).then((value) => {print('Eliminado')});
  }

  void setDataNotifications() async {
    var response = await Firestore.instance
        .collection('notification')
        .where('userOwner', isEqualTo: _user.uid)
        .getDocuments();

    response.documents.forEach((e) {
      // print(e.data.length);
      var data = Notificatione(
        uid: e.documentID,
        owner: e.data['userOwner'],
        date: e['date'] == null
            ? DateTime.now()
            : (e['date'] as Timestamp).toDate(),
        text: e.data['textNotification'],
        read: e.data['read'],
      );

      _notis.add(NotificationTiles(
        noti: data,
      ));

      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    // setDataUser();
    var dataUser = FirebaseAuth.instance.onAuthStateChanged;
    dataUser.forEach((element) {
      element != null ? setDataUser() : print('hola');
    });
  }

  Future<void> singOute() {
    // await GoogleSignIn.signOut();
    FirebaseAuth.instance
        .signOut()
        .then((value) => {print('list')})
        .catchError((e) => print(e));
  }

  Future<void> setDataUser() async {
    var dataUser = await FirebaseAuth.instance.onAuthStateChanged;

    await dataUser.forEach((e) {
      // print(e.displayName);
      _user = User(
        uid: e.uid ?? '',
        name: e.displayName,
        email: e.email,
        photoURL: e.photoUrl ??
            'https://static.dribbble.com/users/460298/screenshots/4289309/nick0_copy.jpg',
      );

      var dataUser = Firestore.instance
          .collection('users')
          .document(_user.uid)
          .snapshots();

      dataUser.forEach((value) => {
            _user = User(
                uid: value.data['uid'],
                name: value.data['name'],
                email: value.data['email'],
                photoURL: value.data['photoURL'],
                phoneNumber: value.data['phoneNumber'],
                adress: value.data['adress'],
                latitlude: value.data['latitude'],
                longitude: value.data['longitude'],
                barrio: value.data['barrio']),
            print(_user.adress),
            _user.adress != null
                ? _pageDecide = InitPageHome()
                : _pageDecide = FormData(),
            update()
          });
      //       .((value) => {
      //          // print(value.data['name'])

      //  });

      update();
    });
    //
  }

  Widget getPage() {
    switch (_user.adress) {
      case null:
        return FormData();
        break;
      default:
        return InitPageHome();
    }
  }

  getFeedBack(uidOrder) {}

  void showStarAlert() {
    var result = Firestore.instance
        .collection('orders')
        .where("userOwner", isEqualTo: _user.uid)
        .getDocuments();

    result.then((value) => {
          value.documents.forEach((element) {
            var stado = element.data['state'];
            var stars = element.data['stars'];
            var uidOrder = element.documentID;

            if (stado == "Finalizado") {
              if (stars == null) {
                getFeedBack(uidOrder);
              } else {
                print("Hola");
              }
            }
          })
        });
  }

  void setDataCardsImage(String url) {
    _url = url;
    update();
  }

  void payWhitEffective(FormInfo form, String typeHouse, numPiso, busqueda,
      selectedPayment, double lat, double long) {
    Get.back();
    Firestore.instance.collection('orders').add({
      'state': 'En proceso',
      'direction': busqueda,
      'recolectionStart': form.fecha,
      'type': form.type,
      'description': form.descripcion,
      'neighborhood': form.barrio,
      'typeHouse': typeHouse == "Edificio"
          ? "${typeHouse}, ${numPiso} "
          : "${typeHouse}",
      'typePayment': selectedPayment,
      'numberPhone': form.numeroTelefono,
      'latitude': lat,
      'longitude': long,
      'flexible': form.flexible,
      'userOwner': _user.name,
      'userOwnerID': _user.uid,
      'price': form.price,
      'services': form.services
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        DocumentReference refUsers =
            Firestore.instance.collection('users').document(_user.uid);
        refUsers.updateData({
          'myOrders': FieldValue.arrayUnion(
              [Firestore.instance.document("users/${snapshot.documentID}")])
        });
      });

      // Get.back();

      Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.greenAccent),
            Text('Confirmado')
          ],
        ),
        content: Text(
          'Tu pedido será procesado, te notificaremos en cuanto sea aceptado',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 19, color: Colors.blueGrey),
        ),
        actions: [
          Row(
            children: [
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 80,
                  height: 45,
                  child: Center(
                    child: Text(
                      'Ir al Inicio',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: kceleste1),
                    ),
                  ),
                ),
                color: opacityCeleste2,
                onPressed: () {
                  Get.back();
                  Get.back();
                },
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                textColor: Colors.white,
                child: Container(
                  width: 150,
                  height: 45,
                  child: Center(
                    child: Text(
                      'Ver mis ordenes',
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
                  Get.back();
                },
              ),
            ],
          )
        ],
      ));
    });
  }

  void goToHome() {
    Get.off(HomeScreen());
  }

  void actionRoute(int action) {
    if (action == 2) {
      Get.to(Manicure());
    } else if (action == 3) {
      Get.to(Pedicure());
    } else if (action == 4) {
      Get.to(ManiAndPedi());
    } else if (action == 5) {
      Get.to(FaceTabs());
    } else if (action == 6) {
      Get.to(Eyebrow());
    } else if (action == 7) {
      Get.to(Masaje());
    }
  }
}

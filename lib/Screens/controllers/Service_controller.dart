import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/notification.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Home/home.dart';
import 'package:bellava/Screens/Home/widget/eyebrow.dart';
import 'package:bellava/Screens/Home/widget/face_tabs.dart';
import 'package:bellava/Screens/Home/widget/manicure.dart';
import 'package:bellava/Screens/Home/widget/manicureandpedicure.dart';
import 'package:bellava/Screens/Home/widget/masaje.dart';
import 'package:bellava/Screens/Home/widget/pedicure.dart';
import 'package:bellava/Screens/Notifications/UI/NotificationPage.dart';
import 'package:bellava/Screens/Notifications/widget/notificationTiles.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ServiceController extends GetxController {
  User _user;
  bool _loadState = true;
  String _url;
  int _star = 0;
  int get star => _star;

  List<Notificatione> notificatione;

  final List<NotificationTiles> _notis = [];
  List<NotificationTiles> get notis => _notis;

  User get user => _user;
  bool get load => _loadState;
  String get url => _url;

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
  }

  Future<void> singOute() async {
    // await GoogleSignIn.signOut();
    await FirebaseAuth.instance.signOut().then((value) => {
      print('list')
    }).catchError((e)=> print(e));
  }

  Future<void> setDataUser() async {
    var dataUser = await FirebaseAuth.instance.onAuthStateChanged;

    await print(dataUser);

    await dataUser.forEach((e) {
      // print(e.displayName);
      _user = User(
        uid: e.uid ?? '',
        name: e.displayName,
        email: e.email,
        photoURL: e.photoUrl ??
            'https://static.dribbble.com/users/460298/screenshots/4289309/nick0_copy.jpg',
      );

      update();
    });
    //
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
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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

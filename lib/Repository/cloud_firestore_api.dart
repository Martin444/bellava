import 'package:bellava/Models/orders.dart';
import 'package:bellava/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CloudFirestoreAPI {

  final String USERS = "users";
  final String ORDERS = "order";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    FirebaseMessaging _firebaseMessagin = FirebaseMessaging();

    _firebaseMessagin.requestNotificationPermissions();

   await _firebaseMessagin.getToken().then((token){
      print('==== FMC TOken ===');
      print(token);
      
        return  ref.setData({
          'uid' : user.uid,
          'name' : user.name,
          'email' : user.email,
          'photoURL' : user.photoURL,
          'myOrders' : user.myOrders,
          'lastSignIn' : DateTime.now(),
          'tokenID' : token,
          'cupo': []
        }, merge: true);
     
      // dFyzn_eLTAaHT7_huc0I0M:APA91bFzrHQJwYLagv2adQnZYswiLXI29FHu8XdaeSD8SBdRUYW8pCGA8BAZQHtyQHTrnFKUdHvkh8nWTHcLyL1rpPVeCJQkr2N6FoSJvl-DfO2TKFYH-iFo1sXV0F2XDplUWQVLAm1p
    });
  }

  Future<void> updateOrderDate(Order order) async{
    CollectionReference refOrders = _db.collection(ORDERS);

    await _auth.currentUser().then((FirebaseUser user){
      refOrders.add({
        'type' : order.type,
        'typePayment': order.typePayment,
        'description': order.description,
        'userOwner' : _db.document("$USERS/${user.uid}"),
        'state': order.state,
        'location': order.direction,
        'neighborhood': order.neighborhood,
        'recolectionStart':order.recolectionStart,
        'numberPhone': order.numberPhone,
        'services': order.services,
        'flexible': order.flexible
      }).then((DocumentReference dr){
        dr.get().then((DocumentSnapshot snapshot){
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);
          refUsers.updateData({
            'myOrders' : FieldValue.arrayUnion([_db.document("$USERS/${snapshot.documentID}")])
          });
        });
      });
    });

  }


}
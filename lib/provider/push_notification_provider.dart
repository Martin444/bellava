import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initNotifications(user)async{
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token){
      print('==== FMC TOken ===');
      print(user);
      
      Firestore.instance.collection("user").document(user).setData({
        'tokenID' : token
      }).then((value) => print(token));
     
      // dFyzn_eLTAaHT7_huc0I0M:APA91bFzrHQJwYLagv2adQnZYswiLXI29FHu8XdaeSD8SBdRUYW8pCGA8BAZQHtyQHTrnFKUdHvkh8nWTHcLyL1rpPVeCJQkr2N6FoSJvl-DfO2TKFYH-iFo1sXV0F2XDplUWQVLAm1p
    });

    _firebaseMessaging.configure(

      onMessage: ( info ) {
        print("==== On Message =====");
        print(info);
      },


      onLaunch: ( info ) {
        print("==== On Launch =====");
        print(info);
      },

      onResume: ( info ) {
        print("==== On Resume =====");
        print(info);
      },


    );
  }
}

import 'package:bellava/Models/orders.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Repository/cloud_firestore_api.dart';



class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updateOrderDate(Order order) => _cloudFirestoreAPI.updateOrderDate(order);



  }
import 'dart:io';

import 'package:bellava/Models/user.dart';
import 'package:bellava/Repository/auth_repository.dart';
import 'package:bellava/Repository/cloud_firestore_api.dart';
import 'package:bellava/Repository/cloud_firestore_repository.dart';
import 'package:bellava/Repository/firebase_storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:bellava/Models/orders.dart';
import 'package:firebase_auth/firebase_auth.dart';




class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos = Streams
  //Stream - firebase

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Casos uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updateOrderDate(Order order) => _cloudFirestoreRepository.updateOrderDate(order);

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  //Creamos un streeam que está escuchando los pedidos y me los trae en tiempo real.
  Stream<QuerySnapshot> orderListStream = Firestore.instance.collection(CloudFirestoreAPI().ORDERS).snapshots();
  Stream<QuerySnapshot> get ordersStream => orderListStream;



    Future<void> signOut() async => _auth_repository.signOut();

  @override
  void dispose() {

  }
}
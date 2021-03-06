import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var servi = Get.find<ServiceController>();

  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;

  @override
  Widget build(BuildContext context) {
    var data = Get.find<ServiceController>();

    return GetBuilder<ServiceController>(
      init: ServiceController(),
      builder: (_) => StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData || snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: LinearProgressIndicator(),
                ),
              );
            } else {
              return _.pageDecide;
            }
          }),
    );
  }
}

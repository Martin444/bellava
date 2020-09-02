import 'package:bellava/Bloc/user_bloc.dart';
import 'package:bellava/Screens/Home/widget/header_profile.dart';
import 'package:bellava/Screens/Orders/widgets/allOrders.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  // User user;

  // OrderPage(this.user);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var controllerServi = Get.find<ServiceController>();
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          // ListMenu(),
          BackGradient(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  HeaderProfile(),
                 
                  SizedBox(height: 20),
                  Text(
                    'Tus próximos planes',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  AllOrders(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

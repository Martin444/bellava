import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Home/widget/profileMenu.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {

  User user;

  OrderPage(this.user);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PerfilMenu(5, widget.user),
    );
  }
}
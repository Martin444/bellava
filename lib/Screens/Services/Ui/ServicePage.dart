import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Services/widgets/ListService.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/Services/widgets/list_service_api.dart';
import 'package:bellava/provider/push_notification_provider.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  User user;

  ServicePage(this.user);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {



  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      // 
      child:
      Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // BackGradient(),
          ListServiceApi(user:widget.user)
          // ListService(widget.user),
        ],
      )
    );
  }
}
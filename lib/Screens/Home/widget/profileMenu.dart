import 'package:bellava/Bloc/user_bloc.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Home/widget/list_menu.dart';
import 'package:bellava/Screens/Home/widget/profileHeader.dart';
import 'package:bellava/Screens/Orders/widgets/allOrders.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class PerfilMenu extends StatefulWidget {

  double height;

  User user;

  PerfilMenu(this.height, this.user);

  @override
  _PerfilMenuState createState() => _PerfilMenuState();
}

class _PerfilMenuState extends State<PerfilMenu> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return Stack(
      alignment: Alignment(0.6, -1.0),
      children: <Widget>[
        // ListMenu(),
        AllOrders(widget.user),
        ProfileHeader(widget.height),
        Positioned(
          top: 90,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: korange,
            child: Icon(Icons.exit_to_app),
            onPressed: (){
                userBloc.signOut();
              }),
        ),
        Positioned(
          top:screenHeight / 30,
          left: 40,
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(
                height: 90,
                image: AssetImage("assets/icon.png")),

              Text(
                "Hola, ${widget.user.name}",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: Colors.white
                ),
                )
            ],
          ),
        )
      ],
    );
  }
}
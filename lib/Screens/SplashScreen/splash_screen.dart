
import 'package:bellava/Bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:bellava/Screens/Home/home.dart';


import 'BoardingView/SliderView.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context,AsyncSnapshot snapshot) {
        if(!snapshot.hasData || snapshot.hasError){
          return Scaffold(
            body: SliderLayoutView()
          );
        }else {
          return Scaffold(
             body: HomeScreen()
             );
        }
      }
    );
  }
}
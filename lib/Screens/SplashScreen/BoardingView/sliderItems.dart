import 'package:bellava/Screens/Home/home.dart';
import 'package:bellava/Screens/TyC/Tyc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bellava/Utils/Buttons.dart';
import 'package:bellava/Utils/TextStyle.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:bellava/Bloc/user_bloc.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bellava/Models/user.dart';


import 'Slider.dart';

class SlideItem extends StatefulWidget {

  final int index;

  SlideItem(this.index);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  UserBloc userBloc;

  bool acept = false;
  String titleButon = "Leer";

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    onPressed (){
      acept ?
            // userBloc.signOut()
              userBloc.signIn().then((FirebaseUser user){
                  userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoUrl,
                  ));
                })
              :
              Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) =>
                        new Terms()
                      ));

      }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.8,
            width: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(sliderArrayList[widget.index].sliderImageUrl))
                ),
          ),
        ),
        SizedBox(
          height: 60.0,
        ),
        BoldText(sliderArrayList[widget.index].sliderHeading, 20.5, kblack),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: widget.index != 2
                  ? NormalText(sliderArrayList[widget.index].sliderSubHeading,kblack, 13.5)
                  : Column(
                      children: <Widget>[
                        NormalText(sliderArrayList[widget.index].sliderSubHeading,kblack, 13.5),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              onChanged: (bool value){
                                setState(() {
                                  acept = value;
                                  acept ? 
                                  titleButon = "Entra con Google": titleButon = "Leer";
                                });
                              },
                              value: acept,),
                            Text("Acepto los términos y condiciones")
                          ],
                        ),
                        WideButton(titleButon ,onPressed),
                      ],
                    )),
        ),
      ],
    );
  }
}

import 'package:bellava/Bloc/user_bloc.dart';
import 'package:bellava/Screens/Delivery/widget/button_purple.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  var cont = Get.find<ServiceController>();

  UserBloc userBloc;


  @override
  Widget build(BuildContext context) {
  

     userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Stack(
        children: [
          BackGradient(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                // User Info top
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Container(
                      // color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              cont.user.name,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: kceleste1,
                            thickness: 3.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: kceleste1,
                                borderRadius: BorderRadius.circular(50)),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(cont.user.photoURL),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/mail.svg',
                          height: 30, color: kceleste1),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Correo electronico',
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            cont.user.email,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   alignment: AlignmentDirectional.bottomCenter,
          //   child: Container(
          //     height: 80,
          //     // width: 215,
          //     child: FloatNext(
          //       onChanged: () {
          //             cont.singOute();
          //       },
          //       text: 'Cerrar sesión',
          //       iconData: Icons.exit_to_app,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

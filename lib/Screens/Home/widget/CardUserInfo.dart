import 'package:bellava/Models/user.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardUserInfo extends StatelessWidget {
  User user;

  bool select;

  CardUserInfo({
    @required this.user,
    @required this.select,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: !select ? Colors.white : opacityPink1,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: !select ? Colors.black12 : Colors.white,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dirección: ${user.adress}',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                '${user.barrio}',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Teléfono: ${user.phoneNumber}',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
              ),
              Container(
                width: 25,
                height: 35,
                child: SvgPicture.asset('assets/icons/location-marker.svg',
                    fit: BoxFit.none, width: 5, color: Colors.blueGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

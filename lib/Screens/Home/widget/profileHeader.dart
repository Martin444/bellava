import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {

  double height;

  ProfileHeader(this.height);

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / widget.height,
      decoration: BoxDecoration(
        color: Color(0xFFB78DD9),
      ),
    );
  }
}
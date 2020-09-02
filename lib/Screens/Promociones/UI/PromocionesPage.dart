import 'package:bellava/Screens/Home/widget/header_profile.dart';
import 'package:bellava/Screens/Promociones/widget/allcupos.dart';
import 'package:bellava/Screens/Promociones/widget/promo_card.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:flutter/material.dart';

class PromocionesPage extends StatefulWidget {
  @override
  _PromocionesPageState createState() => _PromocionesPageState();
}

class _PromocionesPageState extends State<PromocionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGradient(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  HeaderProfile(),
                  SizedBox(height: 30),
                  Text(
                    'Nuestras promociones',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  AllCupos()
                
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

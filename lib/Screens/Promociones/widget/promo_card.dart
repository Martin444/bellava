import 'package:bellava/Models/cupon.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PromoCard extends StatelessWidget {
  Cupon cupon;

  PromoCard({this.cupon});


  @override
  Widget build(BuildContext context) {

    var diavalido = cupon.valido.day;
    var diaenLetras = DateFormat.EEEE('es').add_d().format(cupon.valido);


    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(bottom:10),
      // height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blueGrey[300],
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(20)

      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ticket
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: opacityPink2,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: SvgPicture.asset('assets/icons/ticket.svg',
                  fit: BoxFit.none,
                  height: 40,
                  color: Colors.blueGrey[400]
                ),
              ),
              Column(
                children: [
                  Text('Cupón de descuento \npor ${cupon.descuento} Pesos',
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              SizedBox(width: 15),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Valido hasta',
                    style: TextStyle(
                      color: Colors.blueGrey[400],
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('El ${diaenLetras}',
                    style: TextStyle(
                      color: Colors.blueGrey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Divider(
                // height: 40,
                color: Colors.blueGrey[900],
                thickness: 5,
                indent: 2,
                endIndent: 33,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cupón',
                    style: TextStyle(
                      color: Colors.blueGrey[400],
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(cupon.name,
                    style: TextStyle(
                      color: Colors.blueGrey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          )
        
        ],
      ),
    );
  }
}
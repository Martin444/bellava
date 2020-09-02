import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CovidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGradient(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 30),
                    // BarTop
                    Container(
                      width: Get.width,
                      child: Stack(
                        children: [
                          Container(
                            width: Get.width,
                            height: 90,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Protocolo ante el Covid-19',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ),
                          
                          GestureDetector(
                            child: Container(
                              width: 35,
                              height: 45,
                              // color: Colors.redAccent,
                              child: SvgPicture.asset(
                                'assets/icons/arrow-narrow-left.svg',
                                alignment: AlignmentDirectional.centerStart,
                                // fit: BoxFit.none,
                                height: 30,
                                color: Colors.black87,
                              ),
                            ),
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 10),

                    Text('Esta es la nueva normalidad',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20),
                    Text('Estamos muy felices de poder brindarte el mejor servicio adaptado a la nueva normalidad. Sin embargo, evitemos dar la mano, besos y abrazos. Respetemos el distanciamiento social y preventivo. ¡Ya llegarán esos ansiados momentos!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 20),
                    Text('Nuestros Profesionales de Belleza fueron estrictamente capacitados y evaluados, a fin de brindarte la mayor seguridad e higiene en tus servicios. Todo el personal cumplió con un seminario instructivo y obligatorio.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          child: Stack(
                            alignment: Alignment(-1.3,-1.3),
                            children: [
                               Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: kgreenOpacity,
                                  borderRadius: BorderRadius.circular(10)
                                ),

                                child: Center(
                                  child: SvgPicture.asset('assets/icons/Vector.svg'),
                                ),
                              ),
                            

                              Container(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  backgroundColor: kgreenPrimary,
                                  child: Text('1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19
                                    ),
                                  ),
                                ),
                              ),
                              
                             
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Sin dar la mano, besos y abrazos.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                    Text('Estamos muy felices de poder brindarte el mejor servicio adaptado a la nueva normalidad. Sin embargo, evitemos dar la mano, besos y abrazos. Respetemos el distanciamiento social y preventivo. ¡Ya llegarán esos ansiados momentos!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: Stack(
                            alignment: Alignment(-1.3,-1.3),
                            children: [
                               Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: kgreenOpacity,
                                  borderRadius: BorderRadius.circular(10)
                                ),

                                child: Center(
                                  child: SvgPicture.asset('assets/icons/hands-wash-solid 1.svg'),
                                ),
                              ),
                            

                              Container(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  backgroundColor: kgreenPrimary,
                                  child: Text('2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19
                                    ),
                                  ),
                                ),
                              ),
                              
                             
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Higiene para las manos.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                    Text('Permitale al profesional de Belleza un espacio donde pueda higienizar sus manos antes de comenzar el servicio. Todas las profesionales cuentan con guantes y tapabocas desechables de un solo uso. Los elementos no desechables, son cautelosamente desinfectado en presencia del cliente.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: Stack(
                            alignment: Alignment(-1.3,-1.3),
                            children: [
                               Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: kgreenOpacity,
                                  borderRadius: BorderRadius.circular(10)
                                ),

                                child: Center(
                                  child: SvgPicture.asset('assets/icons/Vector-1.svg'),
                                ),
                              ),
                            

                              Container(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  backgroundColor: kgreenPrimary,
                                  child: Text('3',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19
                                    ),
                                  ),
                                ),
                              ),
                              
                             
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Evita el uso de dinero físico.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                    Text('Evita el uso de dinero físico. Recuerda que siempre puedes pagar con Tarjeta de crédito/débito en nuestra aplicación',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: Stack(
                            alignment: Alignment(-1.3,-1.3),
                            children: [
                               Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: kgreenOpacity,
                                  borderRadius: BorderRadius.circular(10)
                                ),

                                child: Center(
                                  child: SvgPicture.asset('assets/icons/Vector-2.svg'),
                                ),
                              ),
                            

                              Container(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  backgroundColor: kgreenPrimary,
                                  child: Text('4',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19
                                    ),
                                  ),
                                ),
                              ),
                              
                             
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Desechar los elementos desechables y desinfectar antes de salir.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                    Text('Antes de salir, la profesional deberá cambiarse nuevamente de ropa, y desechar los elementos desechables y desinfectar los elementos no desechables.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: Stack(
                            alignment: Alignment(-1.3,-1.3),
                            children: [
                               Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: kgreenOpacity,
                                  borderRadius: BorderRadius.circular(10)
                                ),

                                child: Center(
                                  child: SvgPicture.asset('assets/icons/Vector-3.svg'),
                                ),
                              ),
                            

                              Container(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  backgroundColor: kgreenPrimary,
                                  child: Text('5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19
                                    ),
                                  ),
                                ),
                              ),
                              
                             
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Ayuda a detener el Covid-19.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                    Text('Si te sientes mal, has estado enfermo recientemente o ha estado en contacto con alguien que se haya confirmado que tiene COVID-19, te pedimos que no solicites ningún servicio.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
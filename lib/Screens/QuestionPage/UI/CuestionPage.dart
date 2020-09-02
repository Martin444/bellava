import 'package:bellava/Screens/Delivery/widget/button_purple.dart';
import 'package:bellava/Screens/Home/widget/header_profile.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CuestionPage extends StatefulWidget {
  @override
  _CuestionPageState createState() => _CuestionPageState();
}

class _CuestionPageState extends State<CuestionPage> {
  var controllerServi = Get.find<ServiceController>();

  _buildExpancion(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontSize: 17),
      ),
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey[200],
            child: Text(
              answer,
              style: TextStyle(color: Colors.blueGrey, fontSize: 17),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGradient(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: HeaderProfile()),
                
                
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: Text(
                    'Sobre Bellavá',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Center(
                      child: Text(
                    "Bellavá ® es la primer plataforma virtual argentina que te ofrece un centro de belleza de primer nivel  en la comodidad de tu hogar o sitio de preferencia. A través de una aplicación móvil, nuestro objetivo  es diferenciarnos de los esquemas tradicionales de esta Industria ofreciéndole al Cliente: los mejores precios del  mercado y la mayor comodidad y eficiencia de su tiempo personal.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: Text(
                    "¿Tienes alguna duda?",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 21,
                        fontWeight: FontWeight.w800),
                  )),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      _buildExpancion(
                          "Introduje mal un dato en la orden de mi pedido",
                          "Comunícate con Soporte para que podamos revertir la situación lo más pronto."),
                      _buildExpancion(
                          "Debo cancelar o modificar el horario/día de mi orden",
                          "Debes comunicarte con Soporte 3 horas previas al servicio pactado para que se reintegre el dinero de manera inmediata o a través de un cupón de descuento para la próxima orden. Caso contrario se cobrara una tasa del 50% del servicio solicitado"),
                      _buildExpancion(
                          "Mi servicio solicitado se duplico varias veces.",
                          "-No te preocupes. Nuestro Soporte está al tanto de cualquier inconveniente con la generación de pedidos. Nunca se hará un doble recargo. Recuerda que el servicio que tienes activo puedes chequearlo en la sección “Mis Órdenes”. Allí aparecerán todas tus solicitudes. Las que están activas/vigentes son únicamente las que están en estado de: “En Proceso”, “En breve” o  “En camino”."),
                      _buildExpancion(
                          "Mi solicitud de servicio no fue aceptada.",
                          "Te invitamos a realizar otro en otro horario/día. Si este error persiste, comunícate con Soporte que ellos te asignaran uno de manera urgente."),
                      _buildExpancion(
                          "Mi profesional me quiere hacer un recargo extra por un servicio",
                          "Puede ser que tu requisito no coincida completamente con el servicio que solicitaste. Si se te cobra un extra, dicho precio deberá coincidir completamente con los establecidos dentro de la app. Si tu duda persiste, te solicitamos comunicarte con soporte aclarando la situación brindándote  la mejor transparencia sobre nuestras tarifas."),
                      _buildExpancion(
                          "Tuve un problema o algo no salió bien con mi profesional.",
                          "Comunícate lo antes posible con Soporte para poder asistirte."),
                      _buildExpancion(
                          "Mi profesional desea contactarme para realizar un servicio futuro por vías ajenas a la aplicación.",
                          "Estas prácticas están mal vistas en Bellavá®, ya que perjudica a otros Profesionales de Belleza que prestan su servicio por la app. Te invitamos a comunicarte con Soporte y regalarte un cupón de descuento para una orden futura."),
                      SizedBox(height: 75)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: 80,
              // width: 260,
              child: FloatNext(
                  text: "Contactar soporte",
                  onChanged: () async {
                    const url = 'https://wa.me/5491123904242';
                    await launch(url);
                  },
                  iconData: Icons.chat_bubble_outline,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

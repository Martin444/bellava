import 'package:bellava/Bloc/user_bloc.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Utils/Buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
UserBloc userBloc;


  _buildTitle(title){
    return Container(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
            color: Colors.blueGrey,
          ),
          ),
      );
  }

   _buildSubTitle(subTitle){
    return Container(
        child: Text(
          subTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 19,
            color: Colors.blueGrey,
          ),
          ),
      );
  }

  _buildParraf(parrafo){
    return Container(
        child: Text(
          parrafo,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.blueGrey,
          ),
          ),
      );
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
         
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: ListView(children: <Widget>[
              _buildTitle("BELLAVÁ ® "),
              SizedBox(height: 20),
              _buildSubTitle("Términos y Condiciones – BELLAVÁ ® "),
              SizedBox(height: 10),
              _buildParraf("Los presentes términos y condiciones de servicio regulan la relación contractual entre personas (en adelante “Consumidores”), con BELLAVÁ. El servicio se encuentra destinado exclusivamente a residentes en la República Argentina. Los Consumidores se encontrarán sujetos a los presentes Términos y Condiciones Generales, junto con todas las demás políticas y principios que rigen BELLAVÁ incorporados al presente por referencia. Todo ello con carácter obligatorio y vinculante, debiendo abstenerse de utilizar el sitio en caso de no aceptación."),
              SizedBox(height: 7),
              _buildParraf("BELLAVÁ  facilita la intermediación entre personas (en adelante los “Consumidores”) que solicitan un servicio de Belleza (el “Servicio”) a personas humanas que ofrecen el mismo (en adelante “Profesionales de la Belleza”) y que aceptan, a su propia cuenta y riesgo como prestadores de servicios de belleza y repartidores independientes en carácter de mandatarios, realizar la gestión del servicio solicitado, a cambio de una remuneración por parte del Consumidor como prestación por dicho Servicio, todo ello mediante el acceso y utilización de una plataforma digital (en adelante la “Aplicación”) entendiéndose dicha operación ejecutada a través de un contrato de mandato, donde los PROFESIONALES DE LA BELLEZA actúa como mandatario y el Consumidor como mandante en la presente relación. BELLAVÁ actúa en todo momento como tercero intermediario entre “Profesionales de la Belleza” y Consumidores, siendo una sociedad que pone a disposición, a través de su plataforma, un servicio para que los usuarios prestatarios busquen y evalúen posibles candidatos y donde los usuarios prestadores publiquen datos y perfiles para buscar y evaluar oportunidades de prestación de servicios. "),
              SizedBox(height: 7),
              _buildParraf("Asimismo, usted reconoce que BELLAVÁ no presta servicios de belleza, mensajería, transporte ni logística. Los “Profesionales de la Belleza” prestan el Servicio por cuenta y riesgo propio y liberan a BELLAVÁ de cualquier responsabilidad que pudiera surgir durante la prestación del Servicio de Belleza y Reparto, como también por los términos de contratación pactados entre Usuarios Prestadores y Usuarios Prestatarios en forma posterior a la su conexión a través del Sitio. Los “Profesionales de la Belleza” no serán considerados empleados por BELLAVÁ ni por ninguno de sus afiliados."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA PRIMERA: El Registro"),
              SizedBox(height: 10),
              _buildParraf("1.1.	El acceso a la Aplicación es gratuito, excepto lo relacionado al costo de la conexión a través de la red de telecomunicaciones suministrada por el proveedor de acceso contratado (ISP) por el Usuario, que estará a su exclusivo cargo. BELLAVÁ no será responsable si el Usuario no cuenta con un teléfono celular inteligente compatible con el uso de la Aplicación"),
              SizedBox(height: 7),
              _buildParraf("1.2.	El Consumidor únicamente podrá acceder a la Aplicación a través de los medios autorizados."),
              SizedBox(height: 7),
              _buildParraf("1.3.	Para el acceso a la Aplicación será necesario el registro del Usuario debiendo contar por lo tanto con un Smartphone con sistema operativo IOS o Android completando todos los campos del formulario de inscripción correspondiente con sus Datos Personales, los cuales deberán ser válidos, exactos, precisos y verdaderos (en adelante, el “Usuario Registrado” o en plural “Usuarios Registrados “). Asimismo, el Usuario Registrado asumirá el compromiso de actualizar los Datos Personales cada vez que los mismos sufran modificaciones. BELLAVÁ podrá utilizar diversos medios para identificar a los Usuarios Registrados, pero no se responsabiliza por la certeza de los Datos Personales que sus Usuarios Registrados pongan a su disposición. "),
              SizedBox(height: 7),
              _buildParraf("1.4.	A los efectos de adquirir la condición de Usuario Registrado de BELLAVÁ, el Usuario deberá aceptar la Política de Privacidad, y los presentes Términos y Condiciones."),
              SizedBox(height: 7),
              _buildParraf("1.5.	Una vez Registrado, BELLAVÁ otorgará al Usuario Registrado una cuenta personal para acceder con la contraseña que elija (en adelante la “Cuenta”). La misma es personal, única e intransferible, y está prohibido que un mismo Usuario Registrado registre o posea más de una Cuenta. El Usuario será el único responsable por el uso de su Cuenta. En caso que BELLAVÁ detecte distintas Cuentas que contengan datos coincidentes o relacionados, podrá cancelar, suspender o inhabilitarlas. "),
              SizedBox(height: 7),
              _buildParraf("1.6.	BELLAVÁ se reserva el derecho de solicitar algún comprobante y/o dato adicional a efectos de corroborar los Datos Personales, y de suspender temporal y/o definitivamente a aquel Usuario Registrado cuyos datos no hayan podido ser confirmados. BELLAVÁ NO se responsabiliza por la certeza de los datos consignados en el Registro. El Usuario Registrado garantiza y responde, en cualquier caso, de la veracidad, exactitud, vigencia y autenticidad de sus Datos Personales. Los Datos Personales que el Usuario Registrado proporcione se integrarán en una base de datos personales del que es responsable BELLAVÁ. "),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA SEGUNDA: Condiciones Generales del Uso del Servicio de Cadeteria"),
              SizedBox(height: 10),
              _buildParraf("2.1. El Servicio de Servicios de Belleza y reparto está dirigido exclusivamente a los Usuarios Registrados. "),
              SizedBox(height: 7),
              _buildParraf("2.2. La solicitud de un Servicio, sea en forma inmediata o bajo reserva a través de la Aplicación podrá abonarse únicamente mediante la plataforma de pagos conocida como Mercado Pago (en adelante el “Procesador de Pagos”) o, en su defecto, personalmente cuando el pago se realice en dinero en efectivo. El procesamiento de pagos estará sujeto a todos los términos y condiciones y políticas de privacidad del Procesador de Pagos. BELLAVÁ no será responsable por ningún error u omisión cometido por el Procesador de Pagos. "),
              SizedBox(height: 7),
              _buildParraf("2.3. Un mismo Usuario Registrado podrá solicitar o reservar hasta un número razonable de Servicios de Belleza por día, reservándole a BELLAVÁ la posibilidad de bloquear al Usuario Registrado, por cuestiones de seguridad ante posibilidades de fraude, estafa, uso de datos ajenos, etc."),
              SizedBox(height: 7),
              _buildParraf("2.4. BELLAVÁ se reserva el derecho de rechazar y/o frenar cualquier pedido de los Usuarios Registrados, a su exclusivo criterio."),
              SizedBox(height: 7),
              _buildParraf("2.5. Solicitado y/o realizado una reserva de Servicio de Belleza y Reparto, se le enviará una notificación al Usuario Registrado con las condiciones del Servicio (en adelante “Reserva”). La Reserva incluirá el Detalle de Entrega donde el Profesional de Belleza tiene que cumplir el Servicio. Los Detalles de Entrega deberán incluir: nombre de destinatario, domicilio completo y número telefónico"),
              SizedBox(height: 7),
              _buildParraf("2.7. Cualquier modificación en el Servicio de Belleza será informada al Usuario Registrado mediante su cuenta a través de la app."),
              SizedBox(height: 7),
              _buildParraf("2.8. Una vez efectuada la solicitud del Servicio de Belleza, el Usuario Registrado deberá indicar el día, horario y lugar por donde comenzará el Servicio."),
              SizedBox(height: 7),
              _buildParraf("2.9. El Profesional de Belleza cumplirá el Servicio de Belleza y Reparto entregando la mercadería/servicio a la persona que surge de los Detalles de Entrega, siendo el Usuario Registrado el único responsable por la veracidad de los datos allí introducidos."),
              SizedBox(height: 7),
              _buildParraf("2.10. Está totalmente prohibido utilizar el Servicio de Belleza y Reparto, con fines ilícitos, ilegales, contrarios a lo establecido en los presentes Términos y Condiciones, a la buena fe y al orden público, lesivos de los derechos e intereses de terceros."),
              SizedBox(height: 7),
              _buildParraf("2.11. Está prohibido contactar al Profesional de Belleza por fuentes externas a la App. En este caso, el Consumidor recibirá una compensación en crédito de BELLAVÁ ante el aviso de fraude por parte del Profesional de Belleza."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA TERCERA: Condiciones Particulares del Uso del Servicio de Belleza y Reparto"),
              SizedBox(height: 7),
              _buildParraf("3.1. Una vez que se hayan completado todos los datos en la Aplicación, necesarios para efectuar la búsqueda y/o solicitud de un Servicio, y habiendo aceptado expresamente estos términos y condiciones, BELLAVÁ le hará saber todas las ofertas de los “Profesionales de la Belleza” disponibles de acuerdo con los datos aportados por el Usuario Registrado, en cuyo caso se informarán las tarifas vigentes con sus respectivos impuestos y/o cargo previo a la emisión de la Reserva. En el paso siguiente, se informará el resumen del Servicio de Belleza y reparto en donde constará el precio total a abonar por el Usuario Registrado."),
               SizedBox(height: 7),
              _buildParraf("3.2. Luego de seleccionados los Servicios de Belleza y reparto que se deseen utilizar mediante la Aplicación, será requisito indispensable que el Usuario Registrado incorpore los datos exigidos en los campos allí establecidos y, una vez cumplido ello, se podrá emitir la Reserva correspondiente."),
               SizedBox(height: 7),
              _buildParraf("3.3. Efectuada la solicitud y/o reserva de Servicio de Belleza y reparto antedicha, inmediatamente quedará confirmada la misma."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA CUARTA: Condiciones de Pago y Facturación"),
              SizedBox(height: 7),
              _buildParraf("4.1. El Usuario acepta que sea Bellavá quien fije estas tarifas. Estas serán cobradas directamente por Bellavá de forma automática, mediante el Procesador de Pagos o, en su defecto, personalmente cuando el pago se realice en dinero en efectivo. Las tarifas cobradas se reembolsarán en créditos, en caso de corresponder."),
              SizedBox(height: 7),
              _buildParraf("4.3. Completado el Servicio, se le enviará una notificación al Usuario Registrado con el resumen del servicio cumplido, un detalle de la mercadería/servicio efectivamente entregada y una descripción de la fecha y hora de entrega y el total del monto a abonar con los impuestos incluidos (en adelante, el “Resumen”). El Resumen gozará de validez fiscal, encontrándose habilitado para presentarse ante las autoridades pertinentes."),
              SizedBox(height: 7),
              _buildParraf("4.5. El titular de la tarjeta de crédito es el responsable por los datos consignados al momento de la solicitud y/o reserva del Servicio de Belleza y Reparto seleccionado y es el único obligado al pago frente al emisor de la misma. Cualquier desconocimiento deberá ser efectuado frente del Banco emisor de la tarjeta de crédito de conformidad con lo dispuesto por la Ley de Tarjetas de Crédito Nº 25.065."),
              SizedBox(height: 7),
              _buildParraf("4.6. BELLAVÁ se reserva el derecho de tomar las medidas judiciales y extrajudiciales que estime pertinentes para obtener el pago del monto debido. BELLAVÁ se reserva el derecho de modificar, cambiar, agregar, o eliminar las Tarifas Vigentes, en cualquier momento, lo cual será notificado al Usuario Registrado."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA QUINTA: Uso de la Aplicación"),
              SizedBox(height: 7),
              _buildParraf("5.1. BELLAVÁ se reserva el derecho a los fines de denegar o restringir el uso de la Aplicación a cualquier Usuario bajo su exclusivo criterio, sin generar perjuicio alguno al mismo. El Usuario se compromete a hacer un uso adecuado y lícito de la Aplicación, teniendo en cuenta los siguientes puntos:"),
              SizedBox(height: 7),
              _buildParraf("-	Solo utilizará el Servicio para uso personal y no tendrá facultades para revender su Cuenta a un tercero."),
              SizedBox(height: 7),
              _buildParraf("-	No autorizará a terceros a usar su Cuenta."),
              SizedBox(height: 7),
              _buildParraf("-	No cederá ni transferirá de otro modo su Cuenta a ninguna otra persona o entidad legal. Ni utilizará una cuenta que esté sujeta a cualquier derecho de una persona que no sea ella sin la autorización adecuada."),
              SizedBox(height: 7),
              _buildParraf("-	No solicitará el Servicio con fines ilícitos, ilegales, contrarios a lo establecido en los presentes Términos y Condiciones, a la buena fe y al orden público, lesivos de los derechos e intereses de terceros incluyendo, sin limitación, el transporte de material ilegal o con fines fraudulentos."),
              SizedBox(height: 7),
              _buildParraf("-	No tratará de dañar el Servicio o la Aplicación de ningún modo, ni accederá a recursos restringidos en la Aplicación."),
              SizedBox(height: 7),
              _buildParraf("-	Guardará de forma segura y confidencial la contraseña de su Cuenta y cualquier identificación facilitada para permitirle acceder al Servicio y la Aplicación."),
              SizedBox(height: 7),
              _buildParraf("-	No utilizará el Servicio o la Aplicación con un dispositivo incompatible o no autorizado."),
              SizedBox(height: 7),
              _buildParraf("-	No intentará acceder, utilizar y/o manipular los datos de BELLAVÁ, “Profesionales de la Belleza” y otros Usuarios."),
              SizedBox(height: 7),
              _buildParraf("-	No introducirá ni difundirá introducir o difundir virus informáticos o cualesquiera otros sistemas físicos o lógicos que sean susceptibles de provocar daños en la Aplicación."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA SEXTA: Cancelaciones y Penalidades"),
              SizedBox(height: 7),
              _buildParraf("6.1. El Usuario Registrado podrá cancelar una vez emitida la Reserva, (en adelante, “Cancelación”) sin penalidad alguna siempre que realice la Cancelación del Servicio a través de la Aplicación, dentro de los [5 minutos] posteriores a la aceptación del servicio por parte del Profesional de Belleza."),
              SizedBox(height: 7),
              _buildParraf("6.2. De no efectuarse la Cancelación en el tiempo estipulado en el punto precedente, el Usuario estará obligado a abonar el 100% del monto correspondiente al pago del Servicio de Belleza y reparto."),
              SizedBox(height: 7),
              _buildParraf("6.2. En ningún caso el Usuario podrá alegar falta de conocimiento de las limitaciones, restricciones y penalidades, dado que las mismas son informadas en forma previa a realizar la solicitud del Servicio de Belleza y Reparto a través de la Aplicación, como así también con la notificación de confirmación de la Reserva que BELLAVÁ envía al Usuario Registrado."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA SEPTIMA: Responsabilidad"),
              SizedBox(height: 7),
              _buildParraf("7.1.  BELLAVÁ  interviene en el perfeccionamiento de las operaciones realizadas entre el Profesional de Belleza y el Usuario, brindándole asesoría y estándares previos al servicio."),
              SizedBox(height: 7),
              _buildParraf("7.2 BELLAVÁ no será responsable respecto de la calidad, cantidad, estado, integridad o legitimidad al momento del servicio prestado por el Profesional de Belleza."),
              SizedBox(height: 7),
              _buildParraf("7.3. El Usuario conoce y acepta que realiza las operaciones con el Profesional de Belleza bajo su propio riesgo. En ningún caso BELLAVÁ será responsable por lucro cesante, o por cualquier otro daño y/o perjuicio que haya podido sufrir el Profesional de Belleza, debido al Servicio prestado a través de la Aplicación."),
              SizedBox(height: 7),
              _buildParraf("7.4. En caso que uno o más Usuarios o algún tercero inicien cualquier tipo de reclamo o acciones legales contra un Profesional de Belleza, todos y cada uno de los involucrados en dichos reclamos o acciones eximen de toda responsabilidad a BELLAVÁ."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA OCTAVA: Uso y Garantía de la Aplicación"),
              SizedBox(height: 7),
              _buildParraf("8.1. BELLAVÁ no garantiza la disponibilidad y continuidad del funcionamiento de la Aplicación. En consecuencia, no será en ningún caso responsable por cualquier daño y/o perjuicio que puedan derivarse de:"),
              SizedBox(height: 7),
              _buildParraf("-	La falta de disponibilidad o accesibilidad a la Aplicación; "),
              SizedBox(height: 7),
              _buildParraf("-	La interrupción en el funcionamiento de la Aplicación o fallos informáticos, averías telefónicas, desconexiones, retrasos o bloqueos causados por deficiencias o sobrecargas en las líneas telefónicas, centros de datos, en el sistema de Internet o en otros sistemas electrónicos, producidos en el curso de su funcionamiento; "),
              SizedBox(height: 7),
              _buildParraf("-	Daños que puedan ser causados por terceros mediante intromisiones no autorizadas ajenas al control de BELLAVÁ."),
              SizedBox(height: 7),
              _buildParraf("8.2. BELLAVÁ no garantiza de la ausencia de virus ni de otros elementos en la Aplicación introducidos por terceros ajenos a BELLAVÁ que puedan producir alteraciones en los sistemas físicos o lógicos del Usuario o en los documentos electrónicos y ficheros almacenados en sus sistemas. En consecuencia, BELLAVÁ no será en ningún caso responsable de cualesquiera daños y perjuicios de toda naturaleza que pudieran derivarse de la presencia de virus u otros elementos que puedan producir alteraciones en los sistemas físicos o lógicos, documentos electrónicos o ficheros del Usuario."),
              SizedBox(height: 7),
              _buildParraf("8.3. BELLAVÁ adopta diversas medidas de protección para proteger la Aplicación y los contenidos contra ataques informáticos de terceros. "),
              SizedBox(height: 7),
              _buildParraf("8.4. Con la suscripción de las presentes Términos y Condiciones, Ud. declara que mantendrá indemne frente a cualquier reclamación a BELLAVÁ, su sociedad matriz, directores, socios, empleados, abogados y agentes derivadas del (i) incumplimiento por parte del Usuario de cualquier disposición contenida las presentes en los Términos y Condiciones o de cualquier ley o regulación aplicable a las mismas, (ii) incumplimiento o violación de los derechos de terceros incluyendo, a título meramente enunciativo, otros Usuarios, peatones; y (iii) incumplimiento del uso permitido de la Aplicación."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA NOVENA: Derechos de Propiedad Intelectual e Industrial"),
              SizedBox(height: 7),
              _buildParraf("9.1. El Usuario reconoce y acepta que todos los derechos de propiedad intelectual e industrial sobre los contenidos y/o cualesquiera otros elementos insertados en la Aplicación (incluyendo, sin limitación, marcas, logotipos, nombres comerciales, textos, imágenes, gráficos, diseños, sonidos, bases de datos, software, diagramas de flujo, presentación, audio y vídeo), pertenecen a BELLAVÁ."),
              SizedBox(height: 7),
              _buildParraf("9.2. BELLAVÁ autoriza al Usuario a utilizar, visualizar, imprimir, descargar y almacenar los contenidos y/o los elementos insertados en la Aplicación exclusivamente para su uso personal, privado y no lucrativo, absteniéndose de realizar sobre los mismos cualquier acto de descompilación, ingeniería inversa, modificación, divulgación o suministro. Cualquier otro uso o explotación de cualesquiera contenidos y/u otros elementos insertados en la Aplicación distinto de los aquí expresamente previstos estará sujeto a la autorización previa de BELLAVÁ."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA DECIMA: Notificaciones"),
              SizedBox(height: 7),
              _buildParraf("10.1. BELLAVÁ podrá realizar las notificaciones oportunas al Usuario Registrado a través de una notificación general en la Aplicación."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA DECIMO PRIMERA: Cesión"),
              SizedBox(height: 7),
              _buildParraf("11.1. El Usuario Registrado no podrá ceder sus derechos y obligaciones derivados de los presentes Términos y Condiciones sin el previo consentimiento escrito de BELLAVÁ. BELLAVÁ podrá ceder, sin necesidad de recabar el consentimiento previo del Usuario, los presentes Términos y Condiciones a cualquier entidad comprendida dentro de su grupo de sociedades, en todo el mundo, así como a cualquier persona o entidad que le suceda en el ejercicio de su negocio por cualesquiera títulos."),
              SizedBox(height: 10),
              _buildSubTitle("CLAUSULA DECIMO SEGUNDA: Ley Aplicable y Jurisdicción"),
              SizedBox(height: 7),
              _buildParraf("12.1. Las presentes Términos y Condiciones, así como la relación entre BELLAVÁ y el Usuario, se regirán con arreglo a la legislación vigente en la República Argentina."),
            ],),
          ),
        Positioned(
          bottom: 10,
          left: 5,
          child: Center(
            child: WideButton("Listo" ,(){
                userBloc.signIn().then((FirebaseUser user){

                  userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoUrl,
                  ));
                  Navigator.pop(context);
                });
             }),
          ),
        ),
        
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'CardCategory.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}


class _TabsState extends State<Tabs> {
  int countEsmaltadoC = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          CardCategory("Esmaltado Común", "5000", countEsmaltadoC,  (){}, (){}, "Info"),
          CardCategory("Esmaltado Semipermanente", "5000", countEsmaltadoC,  (){}, (){}, "INfo"),
          CardCategory("Esculpidas", "5000", countEsmaltadoC,  (){}, (){}, "Info"),
          CardCategory("Service de esculpidas con esmalte común.",  "5000", countEsmaltadoC,  (){}, (){}, "info"),
          CardCategory("Service de esculpidas con esmalte semi.", "5000", countEsmaltadoC,  (){}, (){}, "Info"),
          CardCategory("Service de semi con esmalte común","5000", countEsmaltadoC,  (){}, (){}, "Info"),
          CardCategory("Service de semi con esmalte semi",  "5000", countEsmaltadoC,  (){}, (){}, "Info"),
          CardCategory("Decoración simple por uña.", "5000", countEsmaltadoC,  (){}, (){}, "Info"),
          CardCategory("Decoración diseño por uña.", "5000", countEsmaltadoC,  (){}, (){}, "Info"),
          CardCategory("Retirado de semipermanente",  "5000", countEsmaltadoC,  (){}, (){}, "Info"),
          CardCategory("Retirado esculpidas.","5000", countEsmaltadoC,  (){}, (){}, "Info")
        ],
      ),
    );
  }
}
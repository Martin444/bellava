import 'package:bellava/Models/notification.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationTiles extends StatelessWidget {
  var servi = Get.find<ServiceController>();

  Notificatione noti;

  NotificationTiles({this.noti});


  @override
  Widget build(BuildContext context) {
  var diaNoti = noti.date.day;
  var horaNoti = noti.date.hour;
  var minutoNoti = noti.date.minute;

  var diferenciaMinuto = DateTime.now().minute - minutoNoti;
  var diferenciaDia = DateTime.now().day - diaNoti;
  var diferenciaHora = DateTime.now().hour - horaNoti;

  // print('${diferenciaDia} ${diferenciaHora} ${diferenciaMinuto}');

    // ignore: missing_return
    String getDiferenceText(){
      if(diferenciaDia >= 1){
        if(diferenciaDia != 1){
          return 'Hace ${diferenciaDia} dias';
        } else {
          return 'Hace ${diferenciaDia} dia';

        }
      } else if (diferenciaHora <= 24){
        return 'Hace $diferenciaHora hs';
      } else if (diferenciaMinuto <= 59){
        return 'Hace $diferenciaMinuto min';
      }
    }

  

    return GestureDetector(
      onTap: (){
        servi.readNotifications(noti.uid);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: noti.read ? Colors.grey : Colors.green,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: Get.width - 40,
                  child: Text('${noti.text}',
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 19
                    ),
                  ),
                ),
                Text(getDiferenceText(),
                  style: TextStyle(
                    color: Colors.blueGrey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
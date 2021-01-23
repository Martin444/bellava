
import 'package:bellava/Models/orders.dart';
import 'package:bellava/Screens/Orders/UI/order_detail.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
   Order _order;

  Order get order => _order;

  void goToDetails(Order order){
    _order = order;

    Get.to(
      OrderDetails(),
      transition: Transition.fadeIn
      );
  }
}
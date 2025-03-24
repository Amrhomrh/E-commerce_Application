import 'package:get/get.dart';
import 'package:shoping/data/datasours/remout/orders/details_data.dart';
import 'package:shoping/data/modil/ordersDetails_model.dart';

import '../core/class/stutesRequest.dart';
import '../core/function/handling.dart';
import '../core/servesies/servesies.dart';

class DetailsOrdersController extends GetxController{

  DetailsOrdersData ordersData = DetailsOrdersData(Get.find());
  StutesRequest stutesRequest =StutesRequest.nune;
  Myserves myserves = Get.find();
  List<OrdersDetailsModel> orders = [];
  late String orderId;

  getOrdersPending()async{
    stutesRequest = StutesRequest.loading;
    update();
    var response = await ordersData.postData(orderId);
    stutesRequest = handling(response);
    update();
    if(stutesRequest == StutesRequest.success){
      if(response["stutes"] == "success"){
        List responseorders = response["data"];
        orders.addAll(responseorders.map((e) => OrdersDetailsModel.fromJson(e)));
      }
      else{
        stutesRequest = StutesRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    orderId=Get.arguments['ordersId'];
    getOrdersPending();
    super.onInit();
  }

}
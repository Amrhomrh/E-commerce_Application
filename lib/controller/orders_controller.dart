import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/orders/vieworders_data.dart';
import 'package:shoping/data/modil/orders_model.dart';

import '../data/datasours/remout/orders/archive_data.dart';

class OrdersPendingController extends GetxController{
  ViewOrdersData ordersData = ViewOrdersData(Get.find());
  StutesRequest stutesRequest =StutesRequest.nune;
  Myserves myserves = Get.find();
  List<OrdersModels> pendings = [];

  String printPaymentsMethod(String val){
    if(val == "0"){
      return "cash";
    }
    return "card";
  }

  String printOrderType(String val){
    if(val == "0"){
      return "delivery";
    }
    return "drive";
  }

  String printOrdersStates(String val){
    if(val == "0"){
      return "Await Approval";
    }
    else if(val == "1"){
      return "Prepare";
    }
    else if(val == "2"){
      return "On the Way";
    }
    else{
      return "Done";
    }
  }

  getOrdersPending()async{
    pendings.clear();
    stutesRequest = StutesRequest.loading;
    update();
    var response = await ordersData.postData(myserves.sharedpreferences.getString("user_id")!);
    stutesRequest = handling(response);
    update();
    if(stutesRequest == StutesRequest.success){
     if(response["stutes"] == "success"){
       List responseorders = response["data"];
       pendings.addAll(responseorders.map((e) => OrdersModels.fromJson(e)));
     }
     else{
       stutesRequest = StutesRequest.failure;
     }
     update();
    }
  }
  refreshOrder(){
    getOrdersPending();
  }

  gotoDetailsOrders(String id){
    Get.toNamed("/detailsOrders" , arguments: {
      "ordersId":id
    });

  }


  @override
  void onInit() {
    getOrdersPending();
    super.onInit();
  }
}



//////////// OrdersArchiveController
class OrdersArchiveController extends GetxController{

  ArchiveOrdersData ordersData = ArchiveOrdersData(Get.find());
  StutesRequest stutesRequest =StutesRequest.nune;
  Myserves myserves = Get.find();
  List<OrdersModels> archive = [];

  String printPaymentsMethod(String val){
    if(val == "0"){
      return "cash";
    }
    return "card";
  }

  String printOrderType(String val){
    if(val == "0"){
      return "delivery";
    }
    return "drive";
  }

   printOrdersStates(String val){
    if(val == "3"){
      return "Done";
    }


  }

  getOrdersArchive()async{
    stutesRequest = StutesRequest.loading;
    update();
    var response = await ordersData.postData(myserves.sharedpreferences.getString("user_id")!);
    stutesRequest = handling(response);
    update();
    if(stutesRequest == StutesRequest.success){
      if(response["stutes"] == "success"){
        List responseorders = response["data"];
        archive.addAll(responseorders.map((e) => OrdersModels.fromJson(e)));
      }
      else{
        stutesRequest = StutesRequest.failure;
      }
      update();
    }
  }

  refreshOrder(){
    getOrdersArchive();
  }

  gotoDetailsOrders(String id){
    Get.toNamed("/detailsOrders" , arguments: {
      "ordersId":id
    });

  }

  @override
  void onInit() {
    getOrdersArchive();
    super.onInit();
  }
}
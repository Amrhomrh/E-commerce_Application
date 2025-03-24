import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/notification/viewNotification_data.dart';

class NotificationController extends GetxController {

  ViewNotificationData notification = ViewNotificationData(Get.find());
  StutesRequest stutesRequest = StutesRequest.nune;
  Myserves myserves = Get.find();
  List data = [];
  getAllNotification()async{
    stutesRequest = StutesRequest.loading;
    update();
   var response =  await notification.postData(myserves.sharedpreferences.getString("user_id")!);
   stutesRequest = handling(response);
   update();
   if(stutesRequest  == StutesRequest.success){
    if(response["stutes"] == "success" ){
      data.addAll(response["data"]);
    }
    else{
      stutesRequest = StutesRequest.failure;
      update();
    }
   }
  }
  @override
  void onInit() {
    getAllNotification();
    super.onInit();
  }
}
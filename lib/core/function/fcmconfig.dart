import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/orders_controller.dart';
import 'package:shoping/core/constint/color.dart';


requestPermissionNotification()async{

  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig(){

  FirebaseMessaging.onMessage.listen((message){
    print("=======================Notification=============");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!, backgroundColor: AppColor.primaryColor,);
    refreshPageNotification(message.data);
  });
  }
refreshPageNotification(data){
  print("================== PageName");
  print(data["pagename"]);
  print("===========================CurentPage");
  print(Get.currentRoute);
  if(Get.currentRoute == "/orders" && data["pagename"] == "aprroveNotification" ){
    OrdersPendingController controller = Get.find();
    controller.refreshOrder();
  }

}


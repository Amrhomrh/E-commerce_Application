import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/function/fcmconfig.dart';
import 'package:shoping/core/servesies/servesies.dart';
class localeController extends GetxController{
   Locale? language;
    Myserves myserves=Get.find();

  chaneglanguage(String lancode){
    Locale locale=Locale(lancode);
    myserves.sharedpreferences.setString("locale", lancode);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    String? sharedpreflocal=myserves.sharedpreferences.getString("locale");
    if(sharedpreflocal =="ar"){
      language= Locale("ar");
    }
    else if(sharedpreflocal =="en"){
      language = Locale("en");
    }
    else {
      language= Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/view/screen/auth/login.dart';

import '../data/datasours/static/static.dart';

abstract class onboardercontroller extends GetxController{
  next();
  onpageChanged(int index);
}

class onboardercontrollerIm extends onboardercontroller{
  late PageController pagecontroller;
  int curentPage = 0;
  Myserves myserves = Get.find();
  @override
  next() {
    if(curentPage > onboarderlist.length -1){
      myserves.sharedpreferences.setString("step", "1");
      Get.offAllNamed("/login");
    }
    else{
      curentPage++;
      pagecontroller.animateToPage(curentPage, duration: Duration(milliseconds: 900), curve: Curves.easeInOut);

    }
  }

  @override
  onpageChanged(int index) {
    curentPage = index;
    update();
  }
  void onInit(){
    pagecontroller=PageController();
    super.onInit();
  }

}

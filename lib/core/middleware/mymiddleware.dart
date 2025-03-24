import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/view/screen/auth/login.dart';

class MyMiddleWare extends GetMiddleware{
  @override
  int? priority = 1;

  Myserves myserves = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if(myserves.sharedpreferences.getString("step")=="2"){
      return RouteSettings(name: "/index");
    }
    if (myserves.sharedpreferences.getString("step") == "1") {
      return RouteSettings(name: "/login");
    }
  }


}
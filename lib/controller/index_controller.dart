import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/view/screen/users/cart.dart';
import 'package:shoping/view/screen/users/favorites.dart';
import 'package:shoping/view/screen/users/home.dart';
import 'package:shoping/view/screen/profile/profile.dart';
import 'package:shoping/view/screen/users/setings.dart';

abstract class IndexController extends GetxController{
  chargePage(int page);

}

class IndexControllerImp extends IndexController{
  var curentPage=0;
  List<Widget> Page=[
    Home(),
    Favorites(),
    Profile(),
    Setings(),
  ];
  @override
  chargePage(int page) {
    curentPage=page;
    update();
  }
  @override
  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic("amr");
    super.onInit();
  }

}

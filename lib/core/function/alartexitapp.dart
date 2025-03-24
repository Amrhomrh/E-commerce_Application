import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>AlartExitApp(){
  Get.defaultDialog(

    title:"Alert" ,
    middleText: "Are you sure to exit the application?",
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      },

          child: Text("Exit")),
      ElevatedButton(onPressed: (){
        Get.back();
      },

          child:Text("Cancel" )),
    ],
  );
  return Future.value(true);
}
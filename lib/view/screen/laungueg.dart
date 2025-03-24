import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/locallzition/tranzlation_controller.dart';

import '../../controller/users/settings_controller.dart';
class laungueg extends GetView<localeController> {
  const laungueg({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
      body: Column(
        children: [
          Text("textlan".tr),
          Container(
            child: MaterialButton(
              onPressed: (){
                controller.chaneglanguage("ar");
              },
              child: Text("Ar"),

            ),
          ),

          Container(
            child: MaterialButton(
              onPressed: (){
                controller.chaneglanguage("en");
              },
              child: Text("En"),
            ),
          ),
        ],
      ),
    )
    ;
  }
}

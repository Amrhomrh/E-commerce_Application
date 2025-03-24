import 'package:get/get.dart';
import 'package:shoping/core/servesies/servesies.dart';

import '../../core/locallzition/tranzlation_controller.dart';

class SettingsController extends GetxController{
  Myserves myserves = Get.find();
  localeController controller = Get.put(localeController());
  List<String> language=['Arabic' , 'English'];
  String languageNow = 'English';
  bool notification=true;

  changeStatusNotification(val){
    notification = notification==true?false:true;
    update();
  }



  changesLanguage(items){
    if(items == "Arabic"){
      languageNow = "Arabic";
      controller.chaneglanguage("ar");
      update();
    }
    else if(items == "English"){
      languageNow = "English";
      controller.chaneglanguage("en");
      update();
    }
  }


  logOut(){
    myserves.sharedpreferences.clear();
    Get.offAllNamed("/login");

  }
  @override
  void onInit() {

    super.onInit();
  }


}
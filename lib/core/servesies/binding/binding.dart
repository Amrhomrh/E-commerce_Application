import 'package:get/get.dart';
import 'package:shoping/controller/addDetailse_controller.dart';
import 'package:shoping/controller/users/home_controller.dart';
import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/locallzition/tranzlation_controller.dart';
import 'package:shoping/data/datasours/remout/authdata/signupdata.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.put(Curd());
    // Get.lazyPut(()=>AddDetailsAddressController());
    Get.lazyPut(() => HomeControllerImp());
    Get.lazyPut(() => StutesRequest);
    Get.lazyPut(() => localeController());



  }

}
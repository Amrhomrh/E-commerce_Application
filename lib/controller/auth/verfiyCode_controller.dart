import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/data/datasours/remout/authdata/forgetpassword/verfiyforgetpassword.dart';

abstract class verfiyCodeControllerAuth extends GetxController{
  check();
  gotoresetpassword( String verifycode);

}
class verfiyCodeControllerAuthImp extends verfiyCodeControllerAuth{
  late TextEditingController Checkcode ;
  late String email;
  StutesRequest? stutesRequest = StutesRequest.nune;
 VerfiyForgetPassword verify = VerfiyForgetPassword(Get.find());

  @override
  gotoresetpassword(verifycode) async{
    stutesRequest =StutesRequest.loading;
    update();
    var response= await verify.postData(email, verifycode);
    stutesRequest = handling(response);
    if(stutesRequest==StutesRequest.success){
      if(response['stutes']=="success"){
        Get.offNamed("/resetpassword",arguments: {
          'email':email,
        });
      }
      else{
        Get.defaultDialog(title: "Error",middleText: "This verifycode is false again tray write verifycode");
        stutesRequest==StutesRequest.failure;
      }
      update();
    }
    else{}
  }

  @override
  check() {

  }
  @override
  void onInit() {
    Checkcode=TextEditingController();
    email=Get.arguments['email'];
    super.onInit();
  }
  @override
  void dispose() {
    Checkcode.dispose();

    super.dispose();
  }



}
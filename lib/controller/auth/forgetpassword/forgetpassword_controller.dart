import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/data/datasours/remout/authdata/forgetpassword/forgetpassworddata.dart';

abstract class forgetpasControllerAuth extends GetxController{
  check();
  gotoverfiyCode();

}
class forgetpasControllerAuthImp extends forgetpasControllerAuth{
  GlobalKey<FormState> formstate=GlobalKey();
  late TextEditingController EmailCheck ;
  StutesRequest? stutesRequest = StutesRequest.nune;
ForgetPasswordData forget=ForgetPasswordData(Get.find());
  @override
  gotoverfiyCode() async{
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      stutesRequest = StutesRequest.loading;
      update();

      var response = await forget.postData(EmailCheck.text);
      print("=============================================== $response");
      stutesRequest=handling(response);
      print("=============================================== $stutesRequest");
      if(stutesRequest == StutesRequest.success){
        if(response['stutes'] == "success"){
          Get.offNamed("/verfiycode",arguments: {
            'email':EmailCheck.text
          });

        }
        else{
          Get.defaultDialog(title: "Error" , middleText: "This Email is not creact ") ;
          stutesRequest=StutesRequest.failure;
        }
        update();

      }else{}

    }
    // Get.delete<SinupControllerAuthImp>();
    else{
      print("Not valid");
    }



  }

  @override
  check() {

  }


  @override
  void onInit() {
    EmailCheck=TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    EmailCheck.dispose();

    super.dispose();
  }



}
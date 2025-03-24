import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/data/datasours/remout/authdata/forgetpassword/resetpassword.dart';

abstract class resetpasswordcontroller extends GetxController{
  resetpassword();
  gotosuaccessesResetPassword();

}
class resetpasswordcontrollerImp extends resetpasswordcontroller{
  late TextEditingController password ;
  late TextEditingController Repasword ;


  ResetPassword resetPassword=ResetPassword(Get.find());
  GlobalKey<FormState> formstate=GlobalKey();
  StutesRequest? stutesRequest = StutesRequest.nune;
 late String email;

  resetpassword() async {
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      stutesRequest= StutesRequest.loading;
      update();
      var response=await resetPassword.postData(email,password.text);
      stutesRequest = handling(response);
      if(stutesRequest==StutesRequest.success){
        Get.offNamed("/successResetpassword");
      }
      else{}

    }
    else{
      print("Not valid");
    }

  }

bool isshowpassword=true;
  showpassword(){
    isshowpassword = isshowpassword == true ? false:true;
       update();
  }
  bool isshowpassword2=true;
  showpassword2(){
    isshowpassword2 = isshowpassword2 == true ? false:true;
    update();
  }


  @override
  gotosuaccessesResetPassword() {
    Get.offNamed("/successResetpassword");
  }

  @override



  @override
  void onInit() {
    password=TextEditingController();
    email=Get.arguments['email'];
    Repasword=TextEditingController();


    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    Repasword.dispose();
  ;

    super.dispose();
  }



}
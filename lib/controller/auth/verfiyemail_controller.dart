import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/data/datasours/remout/authdata/verifysignupdata.dart';
import 'package:shoping/view/screen/auth/verfiyemail.dart';

abstract class verfiyemailControllerAuth extends GetxController{
  check();
  gotosuccesssingup(String verifycodeSignup);

}
class verfiyemailControllerAuthImp extends verfiyemailControllerAuth{
  late String verifycode ;
  StutesRequest? stutesRequest = StutesRequest.nune;
  VerifySignupData verify=VerifySignupData(Get.find());
  final FirebaseAuth auth = FirebaseAuth.instance;

  String? email;
 late String verificationId;

  //
  // @override
  // gotosuccesssingup(verifycodeSignup) async{
  //   stutesRequest = StutesRequest.loading;
  //   update();
  //   var response = await verify.postData(email!,verifycodeSignup);
  //   stutesRequest=handling(response);
  //   if(stutesRequest==StutesRequest.success){
  //     if(response['stutes']=="success"){
  //       Get.offNamed("/success_singup");
  //     }
  //     else{
  //       Get.defaultDialog(title: "Error" , middleText: "This verifycode is false again tray write verifycode") ;
  //       stutesRequest=StutesRequest.failure;
  //     }
  //     update();
  //   }
  //   else{}
  //
  //
  // }
  @override
  gotosuccesssingup(verifycodeSignup) async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: verifycodeSignup);
    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);
    if(auth.currentUser != null){
      Get.offNamed("/success_singup");

    }

  }

  @override
  check() {

  }


  @override
  void onInit() {
    email=Get.arguments['email'];
    verificationId= Get.arguments['verificationId'];

    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }



}
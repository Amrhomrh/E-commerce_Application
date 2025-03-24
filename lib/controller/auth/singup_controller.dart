import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/data/datasours/remout/authdata/signupdata.dart';

abstract class SinupControllerAuth extends GetxController{
  singup();
  gotocheckemail();
}
class SinupControllerAuthImp extends SinupControllerAuth{
  late TextEditingController Fname ;
  late TextEditingController Emailsup ;
  late  TextEditingController Phone ;
  late  TextEditingController Passwordsup ;
  late TextEditingController conpas ;


  GlobalKey<FormState> formstate=GlobalKey();

  SignupData signupData = SignupData(Get.find());

  StutesRequest stutesRequest = StutesRequest.nune;
  @override
  singup()async {

    var formdata=formstate.currentState;
    if(formdata!.validate()){
      stutesRequest = StutesRequest.loading;
      update();
      var response = await signupData.postData(Fname.text,Emailsup.text,Phone.text,Passwordsup.text);
      print("=============================================== $response");
      stutesRequest=handling(response);
      print("=============================================== $stutesRequest");
      if(stutesRequest == StutesRequest.success){

        if(response['stutes'] == "success"){
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: '+967 773166009',
            verificationCompleted: (PhoneAuthCredential credential) {},
            verificationFailed: (FirebaseAuthException e) {
              print("Erorr MAsseg $e");
              update();
            },
            codeSent: (String verificationId, int? resendToken) {
              Get.offNamed("/verfiyEmail",arguments: {
                'email':Phone.text,
                'verificationId':verificationId
              });
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );


        }
        else{

          Get.defaultDialog(title: "Error" , middleText: "Phone Number Or Email Already Exists") ;
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
  gotocheckemail() {
    Get.offNamed("/verfiyEmail");
  }



  @override
  void onInit() {
    Fname=TextEditingController();
    Emailsup=TextEditingController();
    Phone=TextEditingController();
    Passwordsup=TextEditingController();
    conpas=TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    Fname.dispose();
    Emailsup.dispose();
    Phone.dispose();
    Passwordsup.dispose();
    conpas.dispose();



    super.dispose();
  }

}
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/authdata/logindata.dart';

abstract class LoginControllerAuth extends GetxController{
  login();
  gotosingup();
  gotoforgetpassword();
}
class LoginControllerAuthImp extends LoginControllerAuth{
  StutesRequest stutesRequest = StutesRequest.nune;

 late TextEditingController Emaillog ;
 late TextEditingController Passwordlog ;
GlobalKey<FormState> formstate=GlobalKey();
LoginData loginData=LoginData(Get.find());
bool isshowpassword=true;
Myserves myserves=Get.find();


 @override
 login() async{
   var formdata = formstate.currentState;
   if(formdata!.validate()){
     stutesRequest= StutesRequest.loading;
     update();
     var response=await loginData.postData(Emaillog.text,Passwordlog.text);
     stutesRequest=handling(response);

     if(stutesRequest==StutesRequest.success){
       if(response["stutes"] == "success" ){
         // print("${response['data'][0]['users_id']}");
         // print("${response['data'][0]['users_name']}");
         // print("${response['data'][0]['users_email']}");
         // print("${response['data'][0]['users_phone']}");

         myserves.sharedpreferences.setString('user_id', response['data'][0]['users_id']);
         myserves.sharedpreferences.setString('user_name', response['data'][0]['users_name']);
         myserves.sharedpreferences.setString('user_email', response['data'][0]['users_email']);
         myserves.sharedpreferences.setString('user_phone', response['data'][0]['users_phone']);
         myserves.sharedpreferences.setString("step", "2");
         // FirebaseMessaging.instance.subscribeToTopic("amr${myserves.sharedpreferences.getString('user_id')}");
         Get.toNamed("/index");
       }
       else if(response["stutes"] == "must chick for your verifycode"){
         Get.defaultDialog(title: "Error" ,
             middleText: "must chick for your verifycode");
         stutesRequest=StutesRequest.failure;
       }
       else{
         Get.defaultDialog(title: "Error"    ,
             middleText: "This Email OR Password is roang ");
         stutesRequest=StutesRequest.failure;

       }
       update();
     }
     else{}
     update();
   }
   else{
     print("Not vaild");
   }
 }
 showpassword(){
   isshowpassword = isshowpassword == true ? false:true;
   update();
 }
 @override
 gotoforgetpassword() {
   Get.offNamed("/forgetpassword");
 }
  @override
  gotosingup() {
    Get.offNamed("/singup");
  }
  @override
  void onInit() {
   // FirebaseMessaging.instance.getToken().then((value) {
   //   print(value);
   //   String? token = value;
   // });
    FirebaseMessaging.instance.subscribeToTopic("amr");
    Emaillog=TextEditingController();
    Passwordlog=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    Emaillog.dispose();
    Passwordlog.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/uers/updateUsers_data.dart';
import 'package:shoping/data/datasours/remout/uers/viewUser_data.dart';

class ProFileController extends GetxController{
  StutesRequest stutesRequest = StutesRequest.nune;
 late TextEditingController usernames ;
 late TextEditingController emails ;
 late TextEditingController phones ;
 GlobalKey<FormState> formstate = GlobalKey();


 ViewUserData viewUser = ViewUserData(Get.find());
  UpDateUserData upDateUser = UpDateUserData(Get.find());
  Myserves myserves = Get.find();

  List data=[];


  updateUser()async{
   if(formstate.currentState!.validate()){
     stutesRequest = StutesRequest.loading;
     update();
     var response=await upDateUser.postData(myserves.sharedpreferences.getString("user_id")!, usernames.text, emails.text, phones.text);
     stutesRequest=handling(response);
     if(stutesRequest==StutesRequest.success){

       Get.rawSnackbar(title: "اشعار" ,messageText: Text("تم تعديل بنجاح",
         style: TextStyle(color: AppColor.texthead),) ,backgroundColor: AppColor.primaryColor! );
       getData();
       update();
       Get.offNamed("/ptofile");

     }
     else{
       Get.rawSnackbar(title: "اشعار" ,messageText: Text("لم يتم التعديل بسبب عدم الاتصال بالانترنت",
         style: TextStyle(color: AppColor.texthead),) ,backgroundColor: AppColor.primaryColor! );
     }update();
   }
  }


gotoUpdate(String name , String email , String phone){
    usernames.text=name;
    emails.text=email;
    phones.text=phone;
    Get.toNamed("/updateProfile");
}

getData()async{
    stutesRequest = StutesRequest.loading;
    update();
    var responce = await viewUser.postData(myserves.sharedpreferences.getString("user_id")!);
    stutesRequest = handling(responce);
    if(stutesRequest == StutesRequest.success){
      data.addAll(responce['data']);
    }
    else{
      stutesRequest=StutesRequest.failure;
    }update();
  }

@override
  void onInit() {
  getData();
  usernames = TextEditingController();
  emails = TextEditingController();
  phones = TextEditingController();

  super.onInit();
  }

 @override
 void dispose() {
   usernames.dispose();
   emails.dispose();
   phones.dispose();
   super.dispose();
 }


}
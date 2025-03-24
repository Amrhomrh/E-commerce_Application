import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users/profile_controller.dart';
import '../../../core/constint/color.dart';
import '../../../core/function/validatorinput.dart';
import '../../wedget/custombuttom.dart';
import '../../wedget/customtextfile.dart';
class UpDateProfile extends StatelessWidget {
  const UpDateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProFileController());
    return GetBuilder<ProFileController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Add details Address "),
        ),
        body:
        Container(

          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:Form(
              key: controller.formstate,
              child:  Column(
                children: [
                  Card(
                    color: AppColor.primaryColor,
                    child:Column(
                      children: [
                        customtextfile(titile: "UserName",
                          myController: controller.usernames,
                          vaild: (val) {
                            return validInput(val!, 5, 50, "username");
                          } , Keybordnum: false,icondata: Icons.person,),
                        SizedBox(height: 10,),
                        customtextfile(titile: "Email",
                          myController: controller.emails,
                          vaild: (val) {
                            return validInput(val!, 5, 50, "email");
                          } , Keybordnum: false,icondata: Icons.email,),
                        SizedBox(height: 10,),
                        customtextfile(titile: "Phone",
                          myController: controller.phones,
                          vaild: (val) {
                            return validInput(val!, 5, 50, "username");
                          } , Keybordnum: false,icondata: Icons.phone,),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    child: custombuttom(titilebutton: "Update", onPressed: ()async{
                      await controller.updateUser();

                    }),
                  )

                ],


              ),
            ),
          ),
        ),


      );
    },);
  }
}

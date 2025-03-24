import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoping/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/images.dart';
import 'package:shoping/view/wedget/custombuttom.dart';
import 'package:shoping/view/wedget/customtextfile.dart';

import '../../../../controller/auth/resetpassword_controller.dart';
import '../../../../controller/auth/singup_controller.dart';
import '../../../../core/function/validatorinput.dart';

class resetpassword extends StatelessWidget {
  const resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(resetpasswordcontrollerImp());
    return Scaffold(
        body: GetBuilder<resetpasswordcontrollerImp>(
            builder: (controller) => controller.stutesRequest ==
                    StutesRequest.loading
                ? Center(
                    child: Lottie.asset(imagesAssets.loading),
                  )
                : SingleChildScrollView(
                    child: Form(
                    key: controller.formstate,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                                AppColor.gree1!,
                                AppColor.gree2!,
                                AppColor.gree3!,
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 80,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FadeInUp(
                                    duration: Duration(milliseconds: 1000),
                                    child: Text(
                                      "Reset Password",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                FadeInUp(
                                    duration: Duration(milliseconds: 1300),
                                    child: Text(
                                      "New Password".tr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.background,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60))),
                            child: Padding(
                              padding: EdgeInsets.all(30),
                              child: Column(
                                children: <Widget>[
                                  // FadeInUp(duration: Duration(milliseconds: 1300),
                                  //     child:Text("Enter your Email to check this Email for you  ",
                                  //       style: TextStyle(color: Colors.grey,),) ),

                                  SizedBox(
                                    height: 30,
                                  ),
                                  FadeInUp(
                                      duration: Duration(milliseconds: 1400),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                           ),
                                        child: Column(
                                          children: <Widget>[
                                            GetBuilder<
                                                resetpasswordcontrollerImp>(
                                              builder: (controller) =>
                                                  customtextfile(
                                                titile:
                                                    "Enter your New Password",
                                                myController:
                                                    controller.password,
                                                icondata: Icons.remove_red_eye,
                                                vaild: (val) {
                                                  return validInput(
                                                      val!, 8, 60, "password");
                                                },
                                                Keybordnum: false,
                                                scurtypas:
                                                    controller.isshowpassword,
                                                onTapIcon: () {
                                                  controller.showpassword();
                                                },
                                              ),
                                            ),
                                            GetBuilder<
                                                resetpasswordcontrollerImp>(
                                              builder: (controller) =>
                                                  customtextfile(
                                                titile: "Re your password",
                                                myController:
                                                    controller.Repasword,
                                                icondata: Icons.remove_red_eye,
                                                vaild: (val) {
                                                  return validInput(
                                                      val!, 8, 60, "password");
                                                },
                                                Keybordnum: false,
                                                scurtypas:
                                                    controller.isshowpassword2,
                                                onTapIcon: () {
                                                  controller.showpassword2();
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      )),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  FadeInUp(
                                      duration: Duration(milliseconds: 1600),
                                      child: custombuttom(
                                          titilebutton: "Save",
                                          onPressed: () {
                                            controller.resetpassword();
                                          })),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))));
  }
}

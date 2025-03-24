import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoping/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/images.dart';
import 'package:shoping/core/function/validatorinput.dart';
import 'package:shoping/view/wedget/custombuttom.dart';
import 'package:shoping/view/wedget/customtextfile.dart';

import '../../../../controller/auth/singup_controller.dart';

class forgetpassword extends StatelessWidget {
  const forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(forgetpasControllerAuthImp());
    return Scaffold(
        body: GetBuilder<forgetpasControllerAuthImp>(
            builder: (controller) => controller.stutesRequest ==
                    StutesRequest.loading
                ? Center(
                    child: Lottie.asset(imagesAssets.loading),
                  )
                : SingleChildScrollView(
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
                                      "ForgetPassword",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                FadeInUp(
                                    duration: Duration(milliseconds: 1300),
                                    child: Text(
                                      "Check Email".tr,
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
                                child: Form(
                                  key: controller.formstate,
                                  child: Column(
                                    children: <Widget>[
                                      FadeInUp(
                                          duration:
                                              Duration(milliseconds: 1300),
                                          child: Text(
                                            "Enter your Email to check this Email for you  ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      FadeInUp(
                                          duration:
                                              Duration(milliseconds: 1400),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColor.primaryColor,
                                                borderRadius: BorderRadius.circular(
                                                    10),

                                              ),
                                            child: Column(
                                              children: <Widget>[
                                                customtextfile(
                                                  titile:
                                                      "Enter your Email to check",
                                                  myController:
                                                      controller.EmailCheck,
                                                  vaild: (val) {
                                                    return validInput(
                                                        val!, 3, 30, "email");
                                                  },
                                                  Keybordnum: false,
                                                ),
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      FadeInUp(
                                          duration:
                                              Duration(milliseconds: 1600),
                                          child: custombuttom(
                                              titilebutton: "Chick",
                                              onPressed: () async{
                                               await controller.gotoverfiyCode();
                                              })),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      FadeInUp(
                                          duration:
                                              Duration(milliseconds: 1500),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed("/login");
                                                },
                                                child: Text(
                                                  "Login".tr,
                                                  style: TextStyle(
                                                      color:
                                                          AppColor.primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            Text("I have an account ",style: TextStyle(color: AppColor.texthead),)
                                            ],
                                          )),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )));
  }
}

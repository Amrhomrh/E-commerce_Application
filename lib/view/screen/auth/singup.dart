import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/images.dart';
import 'package:shoping/core/function/validatorinput.dart';
import 'package:shoping/view/wedget/custombuttom.dart';
import 'package:shoping/view/wedget/customtextfile.dart';

import '../../../controller/auth/singup_controller.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SinupControllerAuthImp());
    return GetBuilder<SinupControllerAuthImp>(
        builder: (controller) => HandlingDataRquest(
              stutesRequest: controller.stutesRequest,
              widget: Scaffold(
                  body: SingleChildScrollView(
                      child: Form(
                key: controller.formstate,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topCenter, colors: [
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
                                  "sinuptext".tr,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            FadeInUp(
                                duration: Duration(milliseconds: 1300),
                                child: Text(
                                  "logintext2".tr,
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
                              SizedBox(
                                height: 30,
                              ),
                              FadeInUp(
                                  duration: Duration(milliseconds: 1400),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(
                                            10),

                                      ),
                                      child: GetBuilder<SinupControllerAuthImp>(
                                        builder: (controller) => Column(
                                          children: <Widget>[
                                            customtextfile(
                                              titile: "First Name",
                                              myController: controller.Fname,
                                              vaild: (val) {
                                                return validInput(
                                                    val!, 5, 10, "username");
                                              },
                                              Keybordnum: false,
                                            ),
                                            // customtextfile(titile: "Last Name",myController: controller.Lname,
                                            //   vaild: (val){
                                            //     return validInput(val!, 5, 10, "username");
                                            //   },
                                            //   Keybordnum: false,
                                            // ),
                                            customtextfile(
                                              titile: "Email",
                                              myController: controller.Emailsup,
                                              vaild: (val) {
                                                return validInput(
                                                    val!, 5, 30, "email");
                                              },
                                              Keybordnum: false,
                                            ),
                                            customtextfile(
                                              titile: "Phone",
                                              myController: controller.Phone,
                                              vaild: (val) {
                                                return validInput(
                                                    val!, 0, 9, "phone");
                                              },
                                              Keybordnum: true,
                                              scurtypas: false,
                                            ),
                                            customtextfile(
                                              titile: "Password",
                                              myController:
                                                  controller.Passwordsup,
                                              vaild: (val) {
                                                return validInput(
                                                    val!, 8, 18, "password");
                                              },
                                              icondata: Icons.remove_red_eye,
                                              Keybordnum: false,
                                              scurtypas:
                                                  controller.isshowpassword,
                                              onTapIcon: () {
                                                controller.showpassword();
                                              },
                                            ),
                                            customtextfile(
                                              titile: "Confirm Password",
                                              myController: controller.conpas,
                                              vaild: (val) {
                                                return validInput(
                                                    val!, 8, 18, "password");
                                              },
                                              icondata: Icons.remove_red_eye,
                                              Keybordnum: false,
                                              scurtypas:
                                                  controller.isshowpassword2,
                                              onTapIcon: () {
                                                controller.showpassword2();
                                              },
                                            )
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                height: 20,
                              ),
                              FadeInUp(
                                  duration: Duration(milliseconds: 1600),
                                  child: custombuttom(
                                      titilebutton: "sinuptext".tr,
                                      onPressed: () async {
                                        await controller.singup();
                                      })),
                              SizedBox(
                                height: 20,
                              ),
                              FadeInUp(
                                  duration: Duration(milliseconds: 1500),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("I have an account " ,style: TextStyle(color: Colors.white),),
                                      InkWell(
                                        onTap: () {
                                          Get.offAllNamed("login");
                                        },
                                        child: Text(
                                          "Login".tr,
                                          style: TextStyle(
                                              color: AppColor.texthead,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
            ));
  }
}

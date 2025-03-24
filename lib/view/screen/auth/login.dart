import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/function/alartexitapp.dart';
import 'package:shoping/view/wedget/custombuttom.dart';
import 'package:shoping/view/wedget/customtextfile.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/function/validatorinput.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerAuthImp());
    return GetBuilder<LoginControllerAuthImp>(
        builder: (controller) => Scaffold(
              body: HandlingDataRquest(
                  stutesRequest: controller.stutesRequest,
                  widget: WillPopScope(
                    onWillPop: AlartExitApp,
                    child: SingleChildScrollView(
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
                                          "logintext".tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FadeInUp(
                                        duration: Duration(milliseconds: 1300),
                                        child: Text(
                                          "logintext2".tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
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
                                          duration:
                                              Duration(milliseconds: 1400),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColor.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: <Widget>[
                                                customtextfile(
                                                  titile:
                                                      "Email or phone number",
                                                  myController:
                                                      controller.Emaillog,
                                                  vaild: (val) {
                                                    return validInput(
                                                        val!, 5, 60, "email");
                                                  },
                                                  Keybordnum: false,
                                                ),
                                                GetBuilder<
                                                        LoginControllerAuthImp>(
                                                    builder: (controller) =>
                                                        customtextfile(
                                                          titile: "Password",
                                                          myController:
                                                              controller
                                                                  .Passwordlog,
                                                          icondata: Icons
                                                              .remove_red_eye,
                                                          vaild: (val) {
                                                            return validInput(
                                                                val!,
                                                                0,
                                                                60,
                                                                "password");
                                                          },
                                                          Keybordnum: false,
                                                          scurtypas: controller
                                                              .isshowpassword,
                                                          onTapIcon: () {
                                                            controller
                                                                .showpassword();
                                                          },
                                                        ))
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      FadeInUp(
                                          duration:
                                              Duration(milliseconds: 1500),
                                          child: InkWell(
                                            onTap: () {
                                              controller.gotoforgetpassword();
                                            },
                                            child: Text(
                                              "forgetpas".tr,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      FadeInUp(
                                          duration:
                                              Duration(milliseconds: 1600),
                                          child: custombuttom(
                                              titilebutton: "logintext".tr,
                                              onPressed: () {
                                                controller.login();
                                              })),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      FadeInUp(
                                          duration:
                                              Duration(milliseconds: 1600),
                                          child: custombuttom(
                                              titilebutton: "sinuptext".tr,
                                              onPressed: () {
                                                controller.gotosingup();
                                              })),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      FadeInUp(
                                          duration:
                                              Duration(milliseconds: 1700),
                                          child: Text(
                                            "Continue with social media",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: FadeInUp(
                                                duration: Duration(
                                                    milliseconds: 1800),
                                                child: MaterialButton(
                                                  onPressed: () {},
                                                  height: 50,
                                                  color: Colors.blue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.facebook,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        "Facebook",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Expanded(
                                            child: FadeInUp(
                                                duration: Duration(
                                                    milliseconds: 1900),
                                                child: MaterialButton(
                                                  onPressed: () {},
                                                  height: 50,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  color: Colors.white,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .g_mobiledata_outlined,
                                                        color: Colors.grey,
                                                      ),
                                                      Text(
                                                        "Google",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ));
  }
}

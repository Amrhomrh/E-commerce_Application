import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/images.dart';
import '../../../controller/auth/verfiyemail_controller.dart';

class verfiyEmail extends StatelessWidget {
  const verfiyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(verfiyemailControllerAuthImp());
    return Scaffold(
        body: GetBuilder<verfiyemailControllerAuthImp>(
      builder: (controller) => controller.stutesRequest == StutesRequest.loading
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
                                "${controller.email}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          FadeInUp(
                              duration: Duration(milliseconds: 1300),
                              child: Text(
                                "verification code".tr,
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
                            FadeInUp(
                                duration: Duration(milliseconds: 1300),
                                child: Text(
                                  "Enter the verification code that was sent to your email  ",
                                  style: TextStyle(
                                    color: AppColor.texthead,
                                  ),
                                )),
                            SizedBox(
                              height: 40,
                            ),
                            FadeInUp(
                              duration: Duration(milliseconds: 1400),
                              child: OtpTextField(
                                cursorColor: AppColor.primaryColor,
                                focusedBorderColor: Colors.amber,
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold,color: AppColor.Icons1),
                                fieldWidth: 50,
                                borderRadius: BorderRadius.circular(30),
                                keyboardType: TextInputType.number,
                                numberOfFields: 5,
                                //set to true to show as box or false to show as dash
                                showFieldAsBox: true,
                                //runs when a code is typed in
                                onCodeChanged: (String code) {
                                  //handle validation or checks here
                                },
                                //runs when every textfield is filled
                                onSubmit: (String verificationCode) {
                                  controller.gotosuccesssingup(verificationCode);
                                }, // end onSubmit
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    ));
  }
}

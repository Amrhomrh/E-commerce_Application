import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/constint/color.dart';

import '../../controller/onboarder_controller.dart';
import '../../data/datasours/static/static.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(onboardercontrollerIm());
    return Scaffold(
      // backgroundColor: AppColor.background,

        // appBar: AppBar(
        //   backgroundColor: AppColor.primaryColor,
        // ),
        // backgroundColor: Color(0xFF2155D5),
        body:
          SafeArea(

          // shape: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(70),
          //       borderSide: BorderSide(color: Colors.orange)
          // ),
          //  child:Card(
          //    margin: EdgeInsets.symmetric(horizontal: 40,vertical: 150),
          child: GetBuilder<onboardercontrollerIm>(
            init: onboardercontrollerIm(),
            builder: (controller) => Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                Expanded(
                  flex: 3,
                  // height: 500,
                  // padding: EdgeInsets.symmetric(vertical: 50),
                  child: PageView.builder(
                    controller: controller.pagecontroller,
                    onPageChanged: (value) {
                      controller.onpageChanged(value);
                    },
                    itemCount: onboarderlist.length,
                    itemBuilder: (context, i) => Column(
                      children: [
                        Text(
                          onboarderlist[i].titial!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Image.asset(
                            filterQuality:FilterQuality.high,
                            onboarderlist[i].images!,
                            width: 300,
                            height: 250,
                            fit: BoxFit.fill,
                            cacheWidth: 1000,
                            cacheHeight: 2000,
                          ) ,
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            onboarderlist[i].body!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.8,
                                color: AppColor.Textform,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              onboarderlist.length,

                              (index) => AnimatedContainer(
                                    margin: EdgeInsets.only(right: 6),
                                    alignment: Alignment.center,
                                    duration: Duration(milliseconds: 900),
                                    width:
                                        controller.curentPage == index ? 20 : 6,

                                    height: 6,
                                    decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          child: MaterialButton(
                           padding: EdgeInsets.symmetric(horizontal: 90),
                            onPressed: () {
                            controller.next();
                            },
                            child: Text("next".tr),
                            textColor: Colors.white,
                            color: AppColor.primaryColor,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                             ),
                      )),
                      Container(
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(horizontal: 90),
                            onPressed: () {
                              Get.offAllNamed("login");
                            },
                            child: Text("skip".tr),
                            textColor: AppColor.primaryColor,
                            color:Colors.white ,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          )),

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/users/settings_controller.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/images.dart';
class Setings extends StatelessWidget {
  const Setings({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(SettingsController());
    return GetBuilder<SettingsController>(builder: (controller) => Container(
      child: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 2,
              color: AppColor.primaryColor,
            ),
            Positioned(
              top: Get.width / 2.5,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(imagesAssets.onboarderimagetow),
                  radius: 45,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 80,),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    onTap: (){

                    },
                    title: Text("Disable Notifications "),
                    trailing: Switch(value: controller.notification,activeColor: AppColor.primaryColor,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.red,
                        onChanged: (val){
                      controller.changeStatusNotification(val);
                    }),
                  ),Divider(),
                  ListTile(
                    onTap: (){

                    },
                    title: Text("About Us "),
                    trailing: Icon(Icons.info_outline_rounded),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){
                      Get.toNamed("/viewAddress");

                    },
                    title: Text("Address" ),
                    trailing: Icon(Icons.location_on_outlined),
                  ),

                  Divider(),
                  ListTile(
                    onTap: (){
                      Get.toNamed("/orders");

                    },
                    title: Text("Orders" ),
                    trailing: Icon(Icons.menu_book_outlined),
                  ),

                  Divider(),
                  ListTile(
                    onTap: (){
                      Get.toNamed("/archive");

                    },
                    title: Text("Archive" ),
                    trailing: Icon(Icons.article),
                  ),

                  Divider(),
                  ListTile(
                    onTap: (){

                    },
                    title: Text("Contact Us "),
                    trailing: Icon(Icons.contact_phone_outlined),

                  ),


                  Divider(),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Text("textlan".tr,style: TextStyle(fontSize: 16),) ,
                      ),
                      Spacer(),

                      Container(
                        padding: EdgeInsets.all(16),
                        child: DropdownButton(
                            value: controller.languageNow,
                            items: controller.language
                                .map((items)=>DropdownMenuItem(
                                enabled: true,
                                value: items,
                                child: Text(items))
                            ).toList(),
                            onChanged: (items){
                              controller.changesLanguage(items);
                            }) ,
                      ),

                    ],
                  ),
                  Divider(),

                  ListTile(
                    onTap: (){
                      controller.logOut();
                    },
                    title: Text("log out "),
                    trailing: Icon(Icons.exit_to_app_rounded),
                  ),

                ],
              ),
            )
        )
      ]
      ),
    ),);
  }
}

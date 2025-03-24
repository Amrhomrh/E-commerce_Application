import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping/controller/addDetailse_controller.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/function/validatorinput.dart';
import 'package:shoping/view/screen/address/view.dart';
import 'package:shoping/view/wedget/custombuttom.dart';
import 'package:shoping/view/wedget/customtextfile.dart';

class AddDetailsAddress extends StatelessWidget {
  const AddDetailsAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDetailsAddressController());
    return GetBuilder<AddDetailsAddressController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Add details Address "),
        ),
        body: Container(

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
                        customtextfile(titile: "nameaddress",
                          myController: controller.nameAddress!,
                          vaild: (val) {
                            return validInput(val!, 5, 50, "username");
                          } , Keybordnum: false,icondata: Icons.maps_home_work_outlined,),
                        SizedBox(height: 10,),
                        customtextfile(titile: "citys",
                          myController: controller.citys!,
                          vaild: (val) {
                            return validInput(val!, 5, 50, "username");
                          } , Keybordnum: false,icondata: Icons.location_city_sharp,),
                        SizedBox(height: 10,),
                        customtextfile(titile: "street",
                          myController: controller.street!,
                          vaild: (val) {
                            return validInput(val!, 5, 50, "username");
                          } , Keybordnum: false,icondata: Icons.streetview,),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    child: custombuttom(titilebutton: "AddAddress", onPressed: ()async{
                     await controller.addAddress();
                      controller.refreshData();
                      Get.off(ViewAddress());
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/constint/color.dart';

import '../../../controller/addDetailse_controller.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDetailsAddressController());
    return GetBuilder<AddDetailsAddressController>(builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          controller.refreshData();
          Get.toNamed("/addDetailsAddress");

        },
            child: Icon(Icons.add)),
        appBar: AppBar(
          title: Text("Address"),
        ),
        body: HandlingDataView(
            stutesRequest: controller.stutesRequest,
            widget: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: controller.data.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return
                      Card(
                        shape: StadiumBorder(side: BorderSide(color: Colors.white)),
                        color: AppColor.primaryColor,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${controller.data[index].addressName}", style: TextStyle(
                                      color: AppColor.texthead,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),),
                                  SizedBox(height: 4,),
                                  Text("${controller.data[index].addressCity}", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),

                                  Text("${controller.data[index].addressStreet}", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: IconButton(
                                      onPressed: () async{
                                       await controller.deleteAddress("${controller.data[index].addressId}");
                                        controller.refreshData();
                                      },
                                      icon: Icon(Icons.delete),
                                      iconSize: 30,
                                      color: Colors.redAccent,

                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: IconButton(
                                      onPressed: () async{
                                      await  controller.gotoUpdateAddress("${controller.data[index].addressName}", "${controller.data[index].addressCity}", "${controller.data[index].addressStreet}" ,"${controller.data[index].addressId}");
                                      },
                                      icon: Icon(Icons.edit),
                                      iconSize: 30,
                                      color: Colors.amberAccent,

                                    ),
                                  )
                                ],
                              )
                            ],),
                        ),
                      );
                  },),
              ),
            )),

      );
    }
    );

  }
}

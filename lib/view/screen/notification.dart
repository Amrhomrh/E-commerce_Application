import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/notification_controller.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';

import '../../core/constint/color.dart';

class ViewNotification extends StatelessWidget {
  const ViewNotification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<NotificationController>(builder: (controller) => HandlingDataView(stutesRequest: controller.stutesRequest
          , widget: Container(
            padding: EdgeInsets.all(10),
            child:SingleChildScrollView(
              child:  ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.data[index]["notifi_title"]),
                      subtitle: Text(controller.data[index]["notifi_body"]),
                    ) ;
                  },),
            )
          )),) ,
    ) ;
  }
}

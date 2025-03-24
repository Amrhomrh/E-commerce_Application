import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shoping/controller/users/items_controllers.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/links.dart';
import 'package:shoping/data/modil/cateogrymodle.dart';

class ListCateogryItems extends GetView<ItemsControllerImp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(builder: (controller) =>  Container(
        height: 100,
        child: ListView.builder(
            itemCount: controller.cateogry.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Catogry(
                i:index+1,
                  catoID:controller.catoID,
                  cateogryModel:
                      CateogryModel.fromJson(controller.cateogry[index]));
            })));
  }
}

class Catogry extends GetView<ItemsControllerImp> {
  String catoID;
  int i;
  CateogryModel cateogryModel;

  Catogry({super.key, required this.cateogryModel,required this.i, required this.catoID});

  @override
  Widget build(BuildContext context) {
    // Get.put(ItemsControllerImp);
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => InkWell(
        onTap: () {
          controller.onchange(i,cateogryModel.cateogreyId!);
        },
        child: Container(
          width: 80,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.gree1!,
                AppColor.gree2!,
                AppColor.gree3!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(
                "${AppLinks.LinkImage}/${cateogryModel.cateogreyImages}",
                color: controller.selectcate==i?AppColor.Icons1 : AppColor.Textform,
                width: 25,
                height: 25,
              ),
              SizedBox(height: 8),
              Text("${cateogryModel.cateogreyName}",

                  style: TextStyle(color: controller.selectcate==i?AppColor.Icons1 : AppColor.Textform, fontSize: 12)),
            ],
          ),
        )),);
  }
}

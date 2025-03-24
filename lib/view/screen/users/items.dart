import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping/controller/favorite_controller.dart';
import 'package:shoping/controller/users/items_controllers.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/constint/links.dart';
import 'package:shoping/data/modil/items_model.dart';
import 'package:shoping/view/screen/items/listCateogryItems.dart';
import 'package:shoping/view/screen/items/listproductItems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerfav = Get.put(FavoriteController());
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.teal[600],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 40),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for products...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: (Icon(Icons.notifications_none_outlined,
                            color: Colors.white, size: 28))),
                    Positioned(
                      right: 4,
                      top: 2,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Categories',
                          style: Theme.of(context).textTheme.displayLarge),
                      SizedBox(height: 10),
                      Container(
                        height: 100,
                        child: ListCateogryItems(),
                      ),
                      SizedBox(height: 20),
                      // Product Display Section
                      Text('Featured Products',
                          style: Theme.of(context).textTheme.displayLarge),
                      SizedBox(height: 10),

                      Container(

                          child: GetBuilder<ItemsControllerImp>(
                              builder: (controller) => HandlingDataView(
                                  stutesRequest: controller.stutesRequest,
                                  widget: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: controller.itemsCate.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: .67,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemBuilder: (context, index) {
                                        controllerfav.isFavorite[controller.itemsCate[index]["items_id"]] =
                                            controller.itemsCate[index]
                                                ["favorite"];
                                        return ListProductItems(
                                          // onTap: (){
                                          //   controller.gotodetails(index);
                                          // },
                                          mdel: ItemsMdel.fromJson(
                                              controller.itemsCate[index]),
                                          // isFavorite: controller.isfavorite,
                                        );
                                      }
                                      // controller.item[index]["cate_id"] == "${controller.selectcate}"
                                      ))))
                    ]))));
  }
}

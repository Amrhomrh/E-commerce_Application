import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/favorite_controller.dart';
import 'package:shoping/controller/users/items_controllers.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/links.dart';
import 'package:shoping/data/modil/items_model.dart';

class ListProductItems extends GetView<ItemsControllerImp> {
  // final bool isFavorite;
  final ItemsMdel mdel;

  const ListProductItems({
    super.key,
    required this.mdel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotodetails(mdel);
      },
      child:SingleChildScrollView(
        child: Container(

          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "${AppLinks.LinkImage}/${mdel.itemsImage}",
                      height: 150.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Favorite Icon
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GetBuilder<FavoriteController>(
                      init: FavoriteController(),
                      builder: (controller) => GestureDetector(
                        onTap: () {
                          if (controller.isFavorite[mdel.itemsId] == "1") {
                            controller.setFavorite(mdel.itemsId, "0");
                            controller.deleteFavorite(mdel.itemsId!);
                          } else {
                            controller.setFavorite(mdel.itemsId, "1");
                            controller.addFavorite(mdel.itemsId!);
                          }
                        },
                        child: Icon(
                          controller.isFavorite[mdel.itemsId] == "1"
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: controller.isFavorite[mdel.itemsId] == "1"
                              ? Colors.red
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              // Product Name
              Text(
                "${mdel.itemsName}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "${mdel.itemsDesc}",

                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              // Product Description

              SizedBox(height: 10.0),
              // Price and Discount
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "\$${mdel.itemsPriceDiscount}",
                      style: TextStyle(
                        color: AppColor.Icons1,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  if (mdel.itemsDiscount != "0")
                    Text(
                      "\$${mdel.itemsPrice}",
                      style: TextStyle(
                        color: Colors.amber[400],
                        fontSize: 16.0,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                        decorationThickness: 2.0,
                      ),
                    ),
                  SizedBox(width: 5.0),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}

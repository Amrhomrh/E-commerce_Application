
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping/controller/favorite_controller.dart';
import 'package:shoping/controller/users/home_controller.dart';
import 'package:shoping/controller/users/items_controllers.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoping/core/constint/links.dart';
import 'package:shoping/data/modil/cateogrymodle.dart';
import 'package:shoping/data/modil/items_model.dart';
import 'package:shoping/view/wedget/customappbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerappbar=   Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: CustomAppBar(
              onPressed: () {
                controllerappbar.onSearchItems();
              },
              onChanged: (val) {
                controllerappbar.checkSearch(val);
              },
              mycontroller:controllerappbar.search,
            )
        ),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) =>
                HandlingDataView(
                  stutesRequest: controller.stutesRequest,
                  widget: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: controller.isSearch?ListItemsSearch(listdata: controller.resultSearch,):  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Heroes Section
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 200,
                            child: PageView(
                              children: [
                                _buildHeroItem(context, 'A summer surprise',
                                    'Up to 50% off!', 'Shop Now'),
                                _buildHeroItem(context, 'A summer surprise',
                                    'New Arrivals!', 'Explore'),
                                _buildHeroItem(context, 'A summer surprise',
                                    'Limited Time Offer!', 'Buy Now'),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Categories Section
                          Text('Categories',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displayLarge),
                          SizedBox(height: 10),

                          Container(
                            height: 100,
                            child: ListView.builder(
                                itemCount: controller.cateogry.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    _buildCategoryItem(
                                        context,
                                        CateogryModel.fromJson(controller.cateogry[index]), () {
                                      controller.gotoItems(
                                          controller.cateogry,
                                          controller.cateogry[index]
                                          ["cateogrey_id"],
                                          index + 1);
                                    })),
                          ),
                          SizedBox(height: 20),
                          // Product Display Section
                          Text('Featured Products',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displayLarge),
                          SizedBox(height: 10),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.items.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return _buildProductCard(
                                context,
                                ItemsMdel.fromJson(controller.items[index]),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}

Widget  _buildHeroItem(BuildContext context, String title, String subtitle,
    String buttonText) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.teal[600],
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Stack(
      children: [
        Positioned(
          right: -60,
          top: 0,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(160),
              color: AppColor.button1,
              // image: DecorationImage(image: )
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text(subtitle,
                style: TextStyle(color: Colors.white70, fontSize: 20)),
            SizedBox(height: 16),
          ],
        ),
      ],
    ),
  );
}

Widget  _buildCategoryItem(BuildContext context, CateogryModel cateogry,
    Function()? ontap) {
  return InkWell(
      onTap: ontap,
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
              "${AppLinks.LinkImage}/${cateogry.cateogreyImages}",
              color: AppColor.Icons2,
              width: 25,
              height: 25,
            ),
            SizedBox(height: 8),
            Text("${cateogry.cateogreyName}",
                style: TextStyle(color: AppColor.Textform, fontSize: 12)),
          ],
        ),
      ));
}

Widget _buildProductCard(BuildContext context, ItemsMdel itemsMdel) {
  HomeControllerImp controllerImp= Get.put(HomeControllerImp());
  return InkWell(
    onTap:(){
      controllerImp.gotodetails(itemsMdel);
    },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Image.network(
                        "${AppLinks.LinkImage}/${itemsMdel.itemsImage}",
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              SizedBox(height: 8),
              Text('${itemsMdel.itemsName}',
                  style: TextStyle(
                      color: AppColor.textproduct,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis)),
              Text('\$${itemsMdel.itemsPrice}',
                  style: TextStyle(
                      color: AppColor.textproductscund, fontSize: 14)),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add to Cart',style: TextStyle(color: AppColor.Textform),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.button2),
              ),
            ],
          ),
        ),
      ));
}



class ListItemsSearch extends StatelessWidget {
  final List <ItemsMdel> listdata;
  const ListItemsSearch({super.key,required this.listdata});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerImp= Get.put(HomeControllerImp());
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: listdata.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              controllerImp.gotodetails(listdata[index]);
            },
            child: Container(
              height: 300,
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
                          "${AppLinks.LinkImage}/${listdata[index].itemsImage}",
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
                          builder: (controller) =>
                              GestureDetector(
                                onTap: () {
                                  if(controller.isFavorite[listdata[index].itemsId]=="1"){
                                    controller.setFavorite(listdata[index].itemsId, "0");
                                    controller.deleteFavorite(listdata[index].itemsId!);
                                  }
                                  else{
                                    controller.setFavorite(listdata[index].itemsId, "1");
                                    controller.addFavorite(listdata[index].itemsId!);
                                  }


                                },
                                child: Icon(
                                  controller.isFavorite[listdata[index].itemsId] =="1"
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:controller.isFavorite[listdata[index].itemsId] =="1"? Colors.red : Colors.white,
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  // Product Name
                  Text(
                    "${listdata[index].itemsName}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0),
                  // Product Description
                  Text(
                    "${listdata[index].itemsDesc}",
                    style: TextStyle(

                      color: Colors.white70,
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.0),
                  // Price and Discount
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "\$${listdata[index].itemsPrice}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "${listdata[index].itemsDiscount}%",
                        // "\$${((mdel.itemsPrice ?? 0) - ((mdel.itemsPrice ?? 0) * (mdel.itemsDiscount ?? 0) / 100)).toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.amber[400],
                          fontSize: 16.0,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                    ],
                  ),
                ],
              ),
            ),
          );
        },);
  }
}

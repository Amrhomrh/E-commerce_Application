import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/productdetails_controller.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/links.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerapp =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              controllerapp.cartController.refreshPage();
              Get.toNamed("/cart");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[600],
              padding: EdgeInsets.symmetric(vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.grey[850],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
          child: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    "${AppLinks.LinkImage}/${controller.itemsMdel.itemsImage}",
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),

                // Product Name
                Text(
                  "${controller.itemsMdel.itemsName}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                // Product Details
                Text(
                  "Product DetailsProduct DetailsProduct DetailsProduct Details"
                  "Product DetailsProduct DetailsProduct Details"
                  "Product DetailsProduct DetailsProduct DetailsProduct Details ${controller.itemsMdel.itemsDesc}",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '\$${controller.itemsMdel.itemsPriceDiscount}',
                      style: TextStyle(
                        color: Colors.teal[600],
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Product Quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          // color: Colors.teal,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: 40,
                          width: 40,
                          child: IconButton(
                              onPressed: () {
                                controller.add();
                              },
                              icon: Icon(Icons.add, color: Colors.white)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${controller.countitems}",
                          style: TextStyle(fontSize: 16, color: Colors.amber),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // color: Colors.teal,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: 40,
                          width: 40,
                          child: IconButton(
                              onPressed: () {
                                controller.remove();
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "${controller.totalItemsPrise}",
                          style: TextStyle(
                            color: Colors.amber[600],
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Product Price

                Text(
                  "Colors",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ...List.generate(
                        controller.supProducts.length,
                        (index) => InkWell(
                              onTap: () {
                                controller.choesCroler(
                                    controller.supProducts[index]["color"],
                                    controller.supProducts[index]["name"]);
                                print(controller.supProducts[index]["color"]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                alignment: Alignment.center,
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: controller.supProducts[index]
                                        ["color"],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "${controller.supProducts[index]["name"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                    SizedBox(
                      width: 80,
                    ),
                    GetBuilder<ProductDetailsControllerImp>(
                      builder: (controller) => Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: controller.colorchoes,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "${controller.colorname}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                // Add to Cart Button
              ],
            ),
          ),
        ));
  }
}

// Container(
//   padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
//   child: ListView(
//     children: [
//       Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             height: 200,
//             decoration: BoxDecoration(
//                 color: AppColor.primaryColor,
//                 borderRadius: BorderRadius.all(Radius.circular(30))),
//           ),
//           Positioned(
//             right: 20,
//             left: 20,
//             top: 50.0,
//             child: CachedNetworkImage(
//               imageUrl: AppLinks.LinkImage + "/" + controller.itemsMdel.itemsImage!,
//
//               // width: 200,
//               // height: 200,
//               fit: BoxFit.fill,
//             ),
//           )
//         ],
//       )
//     ],
//   ),
// ),

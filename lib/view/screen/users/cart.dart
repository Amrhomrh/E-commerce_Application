import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/users/cart_controller.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/images.dart';
import 'package:shoping/core/constint/links.dart';
import 'package:shoping/data/datasours/remout/cart/cartviewdata.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text('My Cart'),
          backgroundColor: Colors.teal[600],
        ),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                  stutesRequest: controller.stutesRequest,
                  widget: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        height: 50,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: AppColor.button1,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "You have ${controller.totelitems} Items in your cart",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.cartItems.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              color: Colors.grey[850],
                              elevation: 4,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Image.network(
                                      "${AppLinks.LinkImage}/${controller.cartItems[index].itemsImage}",
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${controller.cartItems[index].itemsName}",
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            '\$${controller.cartItems[index].priceitems}',
                                            style: TextStyle(
                                              color: Colors.amber[600],
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon:
                                              Icon(Icons.remove_circle_outline),
                                          color: Colors.teal[600],
                                          onPressed: () async{
                                           await controller.deleteCart(controller
                                                .cartItems[index].itemsId!);
                                            controller.refreshPage();
                                          },
                                        ),
                                        Text(
                                          "${controller.cartItems[index].countitems}",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add_circle_outline),
                                          color: Colors.teal[600],
                                          onPressed: () async{
                                           await controller.addCart(controller
                                                .cartItems[index].itemsId!);
                                            controller.refreshPage();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$${controller.totelprice}",
                              style: TextStyle(
                                color: Colors.amber[600],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.gotoCheckOut();

                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal[600],
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}

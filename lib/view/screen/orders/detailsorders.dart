import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/detailsOrders_controller.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/constint/links.dart';

import '../../../core/constint/color.dart';
class DetailsOrders extends StatelessWidget {
  const DetailsOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      // body: GetBuilder<DetailsOrdersController>(builder: (controller) => HandlingDataView(stutesRequest: controller.stutesRequest,
      //     widget: SingleChildScrollView(
      //       child: Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: ListView.builder(
      //             shrinkWrap: true,
      //             physics: NeverScrollableScrollPhysics(),
      //             itemCount: controller.orders.length,
      //             itemBuilder: (context, index) {
      //               return Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   // Product Image
      //                   Container(
      //                     height: 250,
      //                     width: double.infinity,
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(20),
      //                       boxShadow: [
      //                         BoxShadow(
      //                           color: Colors.grey.withOpacity(0.5),
      //                           spreadRadius: 5,
      //                           blurRadius: 7,
      //                           offset: Offset(0, 3),
      //                         ),
      //                       ],
      //                     ),
      //                     child: ClipRRect(
      //                       borderRadius: BorderRadius.circular(20),
      //                       child: Image.network("${AppLinks.LinkImage}/${controller.orders[index].itemsImage}",
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(height: 20),
      //
      //                   // Product Name
      //                   Text(
      //                     "${controller.orders[index].itemsName}",
      //                     style: TextStyle(
      //                       fontSize: 24,
      //                       fontWeight: FontWeight.bold,
      //                       color: AppColor.primaryColor,
      //                     ),
      //                   ),
      //                   SizedBox(height: 10),
      //
      //                   // Product Quantity
      //                   Text(
      //                     "Quantity: ${controller.orders[index].countItems}",
      //                     style: TextStyle(
      //                       fontSize: 18,
      //                       color: Colors.teal[600],
      //                       fontWeight: FontWeight.w500,
      //                     ),
      //                   ),
      //                   SizedBox(height: 10),
      //
      //                   // Product Price
      //                   Text(
      //                     "Price: \$${controller.orders[index].priceItems}",
      //                     style: TextStyle(
      //                       fontSize: 18,
      //                       color: Colors.amber[600],
      //                       fontWeight: FontWeight.w500,
      //                     ),
      //                   ),
      //                   SizedBox(height: 20),
      //                 ],
      //               );
      //             },)
      //       ),
      //     )),),

      body: GetBuilder<DetailsOrdersController>(
        builder: (controller) => HandlingDataView(
          stutesRequest: controller.stutesRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.orders.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "${AppLinks.LinkImage}/${controller.orders[index].itemsImage}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),

                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product Name
                                Text(
                                  "${controller.orders[index].itemsName}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                SizedBox(height: 10),

                                // Product Quantity
                                Text(
                                  "Quantity: ${controller.orders[index].countItems}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.teal[600],
                                  ),
                                ),
                                SizedBox(height: 8),

                                // Product Price
                                Text(
                                  "Price: \$${controller.orders[index].priceItems}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.amber[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),


    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shoping/controller/orders_controller.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/constint/color.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<OrdersPendingController>(
        builder: (controller) => HandlingDataView(
          stutesRequest: controller.stutesRequest,
          widget: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.pendings.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[100],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Order Number: ${controller.pendings[index].ordersId}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                              Spacer(),
                              // Text(controller.pendings[index].ordersDatetime!),
                              Text("${Jiffy.parse(controller.pendings[index].ordersDatetime!).fromNow()}" , style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold ),)

                            ],
                          ),
                          const Divider(),
                          Text(
                            "Order Type: ${controller.printOrderType(controller.pendings[index].ordersType!)}",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          Text(
                            "Order Price: ${controller.pendings[index].ordersPrice}\$",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          Text(
                            "Delivery Price: ${controller.pendings[index].ordersPricedelivery}\$",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          Text(
                            "Payment Method: ${controller.printPaymentsMethod(controller.pendings[index].ordersPayments!)}",
                            style: TextStyle(
                              fontSize: 16,

                            ),
                          ),
                          Text(
                            "Order Status: ${controller.printOrdersStates(controller.pendings[index].ordersStutes!)}",
                            style: TextStyle(
                              fontSize: 16,

                            ),
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Text(
                                "Total Price: ${controller.pendings[index].ordersTotalprice}\$",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.texthead,
                                ),
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  controller.gotoDetailsOrders("${controller.pendings[index].ordersId}");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  "More details",
                                  style: TextStyle(
                                    color: AppColor.Textform,
                                    fontSize: 16,
                                  ),
                                ),
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
          ),
        ),
      ),
    );
  }
}

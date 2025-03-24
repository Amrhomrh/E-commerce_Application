import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/checkout_controller.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/view/wedget/checkout_custom/DeliveryMethodCheckout.dart';
import 'package:shoping/view/wedget/checkout_custom/PaymentmethodCheckout.dart';
import 'package:shoping/view/wedget/checkout_custom/addressCartCheckout.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CheckOutController>(builder: (controllers)
      => Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.button1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: MaterialButton(
          onPressed: () async{
           await controllers.checkOutOrders();
          },
          child: Text(
            "CheckOut",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ) ,),
      appBar: AppBar(
        title: Text("CheckOut"),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<CheckOutController>(builder: (controller) {
            return Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(
                    "Choose Payment Method:",
                    style: TextStyle(
                      color: AppColor.textscand,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: (){
                      controller.choosePaymentMethod("0"); // 0 => cach
                    },
                    child: PaymentMethodCheckOut(title: "Cach", isActive:controller.paymentMethod=="0"? true : false),
                  ),
                  InkWell(
                    onTap:(){
                      controller.choosePaymentMethod("1"); // 1=> card
                    },
                    child:   PaymentMethodCheckOut(
                        title: "Payment Cards", isActive:controller.paymentMethod=="1"? true : false),
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Choose Delivery Type:",
                    style: TextStyle(
                      color: AppColor.textscand,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      InkWell(
                        onTap: (){
                          controller.chooseDeliveryType("0"); //0 =>delivery
                        },
                        child:DeliveryMethodCheckOut(
                            icon: Icons.delivery_dining,
                            Active:controller.deliveryType=="0"?true : false,
                            label: "Delivery") ,
                      ),
                      InkWell(
                        onTap: (){
                          controller.chooseDeliveryType("1"); // 1 => drive
                        },
                        child: DeliveryMethodCheckOut(
                            icon: Icons.drive_eta_rounded,
                            Active: controller.deliveryType=="1"?true : false,
                            label: "Drive"),
                      )

                    ],
                  ),
                  SizedBox(height: 20),
                  if(controller.deliveryType=="0")
                  Column(
                    children: [
                      Text(
                        "Shipping Address",
                        style: TextStyle(
                          color: AppColor.textscand,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.address.data.length,
                        itemBuilder: (context, index) {
                        return   InkWell(
                          onTap: (){
                            controller.chooseAddressId("${controller.address.data[index].addressId}");
                          },
                          child:AddressCartCheckOut(
                              title: "${controller.address.data[index].addressName}",
                              subtitle: "${controller.address.data[index].addressStreet}",
                              active: controller.Addressid=="${controller.address.data[index].addressId}"?true : false) ,
                        );
                      },),

                    ],
                  ),

                ],
              ),
            );
          },
        )
    );

  }
}

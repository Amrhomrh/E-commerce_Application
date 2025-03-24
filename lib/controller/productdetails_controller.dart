import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/users/cart_controller.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/data/modil/items_model.dart';

abstract class ProductDetailsController extends GetxController{
  inatialData();
  choesCroler(Color color,String namecolor);
}
class ProductDetailsControllerImp extends ProductDetailsController{
  CartController cartController=Get.put(CartController());
 late ItemsMdel itemsMdel;
  Color? colorchoes  ;
  String? colorname  ;

  int countitems=0;
  double totalItemsPrise=0.0 ;
  StutesRequest stutesRequest = StutesRequest.nune;


 List supProducts=[
   {
     "id":1,
     "color":AppColor.button2,
     "name":"red",
     "actev":"1",
   },
   {
     "id":2,
     "color":AppColor.button1,
     "name":"blue",
     "actev":"0",
   },
   {
     "id":3,
     "color":AppColor.texthead,
     "name":"blau",
     "actev":"0",
   }
 ];
// resetVar(){
//   totalItemsPrise=0.0;
//   countitems = 0;
// }
// refresh(){
//
// }

 getTotal()async{
   var response =  await cartController.getCountItems(itemsMdel.itemsId!);
   var responsedata = response["data"];
   totalItemsPrise =double.parse(responsedata[0]['total']) ;
   countitems = int.parse(responsedata[0]["CountItems"]);
   update();

 }
  @override
  inatialData() {
    stutesRequest = StutesRequest.loading;
    itemsMdel=Get.arguments["product"];

    stutesRequest=StutesRequest.success;
    update();
  }
  add(){
    
    cartController.addCart(itemsMdel.itemsId!);
      countitems++;
      update();


  }

  remove(){
    if(countitems>0){
      cartController.deleteCart(itemsMdel.itemsId!);
      countitems-- ;

      update();
    }
  }


  @override
  void onInit() {

    inatialData();
    getTotal();
    super.onInit();
  }
  @override
  choesCroler (color,namecolor) {
    colorchoes=color;
    colorname=namecolor;
    update();

  }












}
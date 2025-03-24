import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/cart/addcart_data.dart';
import 'package:shoping/data/datasours/remout/cart/cartviewdata.dart';
import 'package:shoping/data/datasours/remout/cart/deletecart_data.dart';
import 'package:shoping/data/datasours/remout/cart/getcountItems.dart';
import 'package:shoping/data/modil/cart_model.dart';

import '../../core/function/handling.dart';

class CartController extends GetxController {
  CartAddData cartAdd = CartAddData(Get.find());
  CartDeleteData cartDelete = CartDeleteData(Get.find());
  ViewCart viewCart = ViewCart(Get.find());
  GetCountItems getCount = GetCountItems(Get.find());
  Myserves myserves = Get.find();
  StutesRequest stutesRequest = StutesRequest.nune;
  List<ModelCart> cartItems = [];
  double totelprice = 0.0;
  int totelitems=0;





  gotoCheckOut(){
    if(cartItems.isEmpty)return Get.snackbar("error ", "the Cart isEmpty",backgroundColor: Colors.white);
    Get.toNamed("/checkout", arguments: {
      "priceorder":totelprice.toString()
    });

  }




  addCart(String itemsid)async{
    stutesRequest= StutesRequest.loading;
    update();
    var response=await cartAdd.postData(myserves.sharedpreferences.getString("user_id")!, itemsid);
    stutesRequest= handling(response);
    if(stutesRequest==StutesRequest.success){
      Get.rawSnackbar(title: "اشعار" ,messageText: Text("تم اضافة المنتج الى السلة",
        style: TextStyle(color: AppColor.texthead),) ,backgroundColor: AppColor.primaryColor! );


    }
    else{
      Get.rawSnackbar(title: "اشعار" ,messageText: Text("لم يتم  اضافة المنتج الى السلة بسبب عدم الاتصال بالانترنت",
        style: TextStyle(color: AppColor.texthead),) ,backgroundColor: AppColor.primaryColor! );
    }update();

  }

  deleteCart(String itemsid)async{

    stutesRequest= StutesRequest.loading;
    update();
    var response=await cartDelete.postData(myserves.sharedpreferences.getString("user_id")!, itemsid);
    stutesRequest= handling(response);
    if(stutesRequest==StutesRequest.success){
      Get.rawSnackbar(title: "اشعار" ,messageText: Text("تم حذف المنتج من السلة",
        style: TextStyle(color: AppColor.texthead),) ,backgroundColor: AppColor.primaryColor! );

    }
    else{
      Get.rawSnackbar(title: "اشعار" ,messageText: Text("  لم يتم  حذف المنتج الى السلة بسبب عدم الاتصال بالانترنت",
        style: TextStyle(color: AppColor.texthead),) ,backgroundColor: AppColor.primaryColor! );
    }update();

  }

  resetVarCart(){
    totelitems=0;
    totelprice=0.0;

  }

  refreshPage(){
    resetVarCart();
    getCart();
  }


  getCart() async {
    stutesRequest == StutesRequest.loading;
    update();
    var response = await viewCart
        .postData(myserves.sharedpreferences.getString("user_id")!);
    stutesRequest = handling(response);
    if (stutesRequest == StutesRequest.success) {
      if (response["stutes"] == "success") {
        List redponnsedata = response["data"];
        Map responsedatapricecount = response["countpraice"];
        cartItems.clear();
        cartItems.addAll(redponnsedata.map((e) => ModelCart.fromJson(e)));
        totelprice = double.parse(responsedatapricecount['totalprice']);
        totelitems =  int.parse(responsedatapricecount['totalcount']);

      } else {
        stutesRequest = StutesRequest.failure;
      }
      update();
    }

  }

  getCountItems(String itemsid)async{

    stutesRequest== StutesRequest.loading;
    update();
    var response=await getCount.postData(myserves.sharedpreferences.getString("user_id")!, itemsid);
    stutesRequest= handling(response);
    if(stutesRequest==StutesRequest.success){
        return  response;



    }
    else{
      stutesRequest = StutesRequest.failure;

    }update();
  }

  @override
  void onInit() {
    getCart();
    super.onInit();
  }
}

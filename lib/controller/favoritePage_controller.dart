import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/favorite/viewfavorite_data.dart';
import 'package:shoping/data/modil/myfavorite.dart';

import '../data/datasours/remout/favorite/deletfavorite_data.dart';

class FavoritePageController extends GetxController{
  ViewFavorite viewFavorite = ViewFavorite(Get.find());
  DeleteFavorite delete =DeleteFavorite(Get.find());

  StutesRequest stutesRequest=StutesRequest.nune;
  List<FavoriteModel> myFavorite=[];
Myserves myserves = Get.find();
  getMyFavorite()async{
    stutesRequest = StutesRequest.loading;
    update();
    var response = await viewFavorite.postData(myserves.sharedpreferences.getString("user_id")!);
    stutesRequest =handling(response);
    if(stutesRequest == StutesRequest.success){
      if(response["stutes"] == "success"){
        List responsedata = response["data"];
        myFavorite.addAll(responsedata.map((e) => FavoriteModel.fromJson(e)));
        // myFavorite.addAll(response["data"]);
        print("dsssssssss$myFavorite");

      }
      else{
        stutesRequest=StutesRequest.failure;
      }update();
    }
  }


  deleteFavorite( String itemsid)async{

    stutesRequest= StutesRequest.loading;
    update();
    var response = await delete.postData(myserves.sharedpreferences.getString("user_id")! , itemsid );
    stutesRequest=handling(response);
    if(stutesRequest == StutesRequest.success){
      if(response["stutes"] == "success"){
        Get.rawSnackbar(title: "اشعار" ,messageText: Text("تم حذف المنتج من المفضلة",style: TextStyle(color: AppColor.texthead),) ,backgroundColor: AppColor.primaryColor! );
        myFavorite.removeWhere((element) => element.itemsId == itemsid);

      }
      else{

        stutesRequest=StutesRequest.failure;
      }update();
    }

  }





  @override
  void onInit() {
    getMyFavorite();
    super.onInit();
  }
}
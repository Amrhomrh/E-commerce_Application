import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/favorite/addfavorite_data.dart';
import 'package:shoping/data/datasours/remout/favorite/deletfavorite_data.dart';

import '../core/function/handling.dart';

class FavoriteController extends GetxController{

  StutesRequest stutesRequest = StutesRequest.nune;

  AddFavorite add=AddFavorite(Get.find());
  DeleteFavorite delete =DeleteFavorite(Get.find());
Myserves myserves=Get.find();
  Map isFavorite ={};
  setFavorite(id , value){
    isFavorite[id]=value;
    update();
  }

  addFavorite(String itemsid)async{
    stutesRequest= StutesRequest.loading;
    update();
    var response = await add.postData(myserves.sharedpreferences.getString("user_id")!, itemsid );
    stutesRequest=handling(response);
    if(stutesRequest == StutesRequest.success){
      if(response["stutes"] == "success"){
        Get.rawSnackbar(title: "اشعار" ,messageText: Text("تم اضافة المنتج الى المفضلة",style: TextStyle(color: AppColor.texthead),) ,backgroundColor: AppColor.primaryColor! );

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
      }
      else{

        stutesRequest=StutesRequest.failure;
      }update();
    }

  }


}
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/users/items_controllers.dart';
import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/home_data.dart';
import 'package:shoping/data/datasours/remout/items/searchitems_data.dart';
import 'package:shoping/data/modil/cateogrymodle.dart';
import 'package:shoping/data/modil/items_model.dart';

abstract class HomeController extends GetxController {
  inatioal();

  signout();

  getData();

  gotoItems(List cateogries, String catoId, int selectcat);
}

class HomeControllerImp extends HomeController {

  Myserves myserves = Get.find();
  late TextEditingController search;
  String? username;
  String? email;
  String? phone;
  List cateogry = [];
  List items = [];
  List<ItemsMdel> resultSearch=[] ;
  SearchItemsData searchItemsData = SearchItemsData(Get.find());
  HomeData homeData = HomeData(Get.find());

  StutesRequest stutesRequest = StutesRequest.nune;
  ItemsMdel itemsMdel = ItemsMdel();
  CateogryModel cateogryModel = CateogryModel();
  bool isSearch = false;

  checkSearch(val){
  if(val == ""){
    isSearch = false;
  }
  update();
  }
  onSearchItems(){
    searchData();
    isSearch = true;
    update();
  }


  inatioal() {
    username = myserves.sharedpreferences.getString("user_name");
    email = myserves.sharedpreferences.getString("user_email");
    phone = myserves.sharedpreferences.getString("user_phone");
  }

  signout() {
    myserves.sharedpreferences.clear();
  }

  @override
  getData() async {
    stutesRequest = StutesRequest.loading;
    update();
    var response = await homeData.postData();

    stutesRequest = handling(response);
    print(response['cateogreys']);
    if (stutesRequest == StutesRequest.success) {
      if (response["stutes"] == "success") {
        cateogry.addAll(response['cateogreys']);
        items.addAll(response['items']);
      } else {
        stutesRequest == StutesRequest.failure;
      }
      update();
    } else {}
  }

  searchData()async{
    resultSearch.clear();
    update();
    stutesRequest == StutesRequest.loading;
    update();
    var response = await searchItemsData.postData(search.text);
    stutesRequest = handling(response);
    if (stutesRequest == StutesRequest.success) {
      if (response["stutes"] == "success") {
        List responsedata = response["data"];
        resultSearch.addAll(responsedata.map((e) => ItemsMdel.fromJson(e)));
      } else {
        stutesRequest == StutesRequest.failure;
      }
      update();
    } else {}

  }



  @override
  gotoItems(cateogries, catoID, selectcat) {
    Get.toNamed("/items", arguments: {
      "cateogries": cateogries,
      "cateogry": catoID,
      "selectcate": selectcat,
    });
  }

  @override
  gotodetails(itemsMdel) {
    Get.toNamed("/productDetails" , arguments: {
      "product":itemsMdel,
    });
  }

  @override
  void onInit() {
    search = TextEditingController();
    FirebaseMessaging.instance.subscribeToTopic("amr");
    FirebaseMessaging.instance.subscribeToTopic("amr${myserves.sharedpreferences.getString('user_id')}");
    getData();
    inatioal();

    super.onInit();
  }
}

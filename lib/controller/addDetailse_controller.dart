import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/address/addaddress_data.dart';
import 'package:shoping/data/datasours/remout/address/updateAddress_data.dart';
import 'package:shoping/data/datasours/remout/address/viewAddress_data.dart';
import 'package:shoping/data/modil/address_model.dart';
import 'package:shoping/view/screen/address/view.dart';

import '../core/constint/color.dart';
import '../data/datasours/remout/address/deleteAddress_data.dart';

class AddDetailsAddressController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController? nameAddress;
  TextEditingController? citys;
  TextEditingController? street;
  String? idAddress;
  String lat = "0.0";
  String long = "0.0";
  StutesRequest stutesRequest = StutesRequest.nune;
  Myserves myserves = Get.find();
  AddAddressData addAddressData = AddAddressData(Get.find());
  ViewAddressData view = ViewAddressData(Get.find());
  DeleteAddressData delete = DeleteAddressData(Get.find());
  UpDateAddressData upDate = UpDateAddressData(Get.find());
  List<AddressModel> data = [];


  deleteAddress(String addressId)async {
    stutesRequest = StutesRequest.loading;
    update();
    var response = await delete.postData(addressId);
    stutesRequest = handling(response);
    if (stutesRequest == StutesRequest.success) {
      if (response["stutes"] == "success") {
        Get.rawSnackbar(title: "اشعار",
            messageText: Text("تم حذف عنوانك",
              style: TextStyle(color: AppColor.texthead),),
            backgroundColor: AppColor.primaryColor!);
      }
      else {
        stutesRequest = StutesRequest.failure;
      }update();
    }
  }



  getData()async{
    stutesRequest= StutesRequest.loading;
    update();
    var response = await view.postData(myserves.sharedpreferences.getString("user_id")!);
    stutesRequest=handling(response);
    if(stutesRequest == StutesRequest.success){
      if(response["stutes"] == "success"){
        List responsedata=response['data'];
        data.addAll(responsedata.map((e) => AddressModel.fromJson(e)));
      }
      else{
        stutesRequest=StutesRequest.failure;
      }update();
    }


  }



  editDataAddress()async{
    if (formstate.currentState!.validate()) {
      stutesRequest = StutesRequest.loading;
      update();
      var response = await upDate.postData(myserves.sharedpreferences.getString("user_id")!, nameAddress!.text, citys!.text, street!.text, idAddress!);
      stutesRequest = handling(response);
      if (stutesRequest == StutesRequest.success) {
        if (response["stutes"] == "success") {
          Get.rawSnackbar(
              title: "اشعار",
              messageText: Text(
                "تم تعديل موقعك  ",
                style: TextStyle(color: AppColor.texthead),
              ),
              backgroundColor: AppColor.primaryColor!);
          // Get.off(ViewAddress());
        } else {
          Get.rawSnackbar(
              title: "اشعار",
              messageText: Text(
                "لم يتم تعديل موقعك  ",
                style: TextStyle(color: AppColor.texthead),
              ),
              backgroundColor: AppColor.primaryColor!);
          stutesRequest = StutesRequest.failure;
        }
        update();
      }
    } else {
      print("Not Valid");
    }




  }
  addAddress() async {
    if (formstate.currentState!.validate()) {
      stutesRequest = StutesRequest.loading;
      update();
      var response = await addAddressData.postData(myserves.sharedpreferences.getString("user_id")!, nameAddress!.text, citys!.text, street!.text, lat, long);
      stutesRequest = handling(response);
      if (stutesRequest == StutesRequest.success) {
        if (response["stutes"] == "success") {
          Get.rawSnackbar(
              title: "اشعار",
              messageText: Text(
                "تم اضافة موقعك  ",
                style: TextStyle(color: AppColor.texthead),
              ),
              backgroundColor: AppColor.primaryColor!);
          // Get.off(ViewAddress());
        } else {
          Get.rawSnackbar(
              title: "اشعار",
              messageText: Text(
                "لم يتم اضافة موقعك  ",
                style: TextStyle(color: AppColor.texthead),
              ),
              backgroundColor: AppColor.primaryColor!);
          stutesRequest = StutesRequest.failure;
        }
        update();
      }
    } else {
      print("Not Valid");
    }
  }

  gotoUpdateAddress(String name , String city , String streets , String addressId){
    nameAddress?.text = name;
    citys?.text = city;
    street?.text=streets;
    idAddress = addressId;
    update();
    Get.toNamed("/updateAddress");
  }

  resetvalue(){
    nameAddress = TextEditingController();
    citys = TextEditingController();
    street = TextEditingController();
    data = [];
  }
  refreshData(){
    resetvalue();
    getData();
  }


  @override
  void onInit() {
    getData();
    nameAddress = TextEditingController();
    citys = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }
}

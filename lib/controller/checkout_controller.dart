import 'package:get/get.dart';
import 'package:shoping/controller/addDetailse_controller.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/orders/checkout_data.dart';

import '../core/constint/color.dart';

class CheckOutController extends GetxController{
  AddDetailsAddressController address = Get.put(AddDetailsAddressController());
  CheckOutData checkOutData = CheckOutData(Get.find());
  StutesRequest stutesRequest = StutesRequest.nune;
  Myserves myserves = Get.find();
  String? paymentMethod;
  String? deliveryType;
  String Addressid = "0";
  late String priceorder;

  choosePaymentMethod(String val){
    paymentMethod=val;
    update();

  }
  chooseDeliveryType(String val){
    deliveryType = val;
    update();

  }
  chooseAddressId(String val){
    Addressid=val;
    update();

  }

  checkOutOrders()async{

    if(paymentMethod == null) return Get.snackbar("Error", "Please select a payment method");
    if(deliveryType == null) return Get.snackbar("Error", "Please select a deliveryType method");
    if(deliveryType == "0" && Addressid == "0") return Get.snackbar("Error", "Please select a address method");


    stutesRequest=StutesRequest.loading;
    update();
    var response = await checkOutData.postData(
        myserves.sharedpreferences.getString("user_id")!,
        Addressid,
        deliveryType!,
        "100",
        priceorder.toString(),
        paymentMethod!);

    stutesRequest=handling(response);
    if(stutesRequest == StutesRequest.success){
      print("hcggggggggggjjjjjjjjjjjjjjjjjjg ");
      if(response["stutes"] == "success"){
        Get.offAllNamed("/homeuser");
        Get.snackbar("Success", "the order was success",colorText: AppColor.texthead,backgroundColor: AppColor.primaryColor!);
      }
      else{
        stutesRequest =StutesRequest.nune;
        Get.snackbar("Error", "try again", colorText: AppColor.texthead,backgroundColor: AppColor.primaryColor!);
      }
    }
    // else{
    //   stutesRequest =StutesRequest.nune;
    //   Get.snackbar("Errrrrrrrrror", "try again");
    // }
  }

  @override
  void onInit() {
    priceorder=Get.arguments['priceorder'];
    super.onInit();
  }


}
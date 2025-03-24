import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class CheckOutData{

  Curd curd;
  CheckOutData(this.curd);

  postData(String userid, String addressid,String orderstypes,String pricedelivery ,String ordersprice ,String payments  )async{
    var response=await curd.postData(AppLinks.linkCheckoutOrders ,{
      'userid':userid,
      'addressid':addressid,
      'orderstypes': orderstypes,
      'pricedelivery': pricedelivery,
      'ordersprice': ordersprice ,
      'payments': payments,
    });
    return response.fold((l) => l, (r) => r);
  }

}
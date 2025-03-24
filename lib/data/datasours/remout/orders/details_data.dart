import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class DetailsOrdersData{

  Curd curd;
  DetailsOrdersData(this.curd);

  postData(String ordersId )async{
    var response=await curd.postData(AppLinks.linkDetailsOrders ,{
      'orderId':ordersId,
    });
    return response.fold((l) => l, (r) => r);
  }

}
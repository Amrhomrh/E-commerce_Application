import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ViewOrdersData{

  Curd curd;
  ViewOrdersData(this.curd);

  postData(String userid )async{
    var response=await curd.postData(AppLinks.linkViewOrders ,{
      'userid':userid,
    });
    return response.fold((l) => l, (r) => r);
  }

}
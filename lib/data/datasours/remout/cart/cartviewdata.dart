import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ViewCart {
  Curd curd;
  ViewCart(this.curd);

  postData(String userid )async{
    var response =await curd.postData(AppLinks.linkViewCart, {
      "userid":userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
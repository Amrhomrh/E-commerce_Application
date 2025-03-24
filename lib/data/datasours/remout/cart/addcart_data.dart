import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class CartAddData{

  Curd curd;
  CartAddData(this.curd);

  postData(String userid, String itemsid)async{
    var response=await curd.postData(AppLinks.linkAddCart ,{
      'userid':userid,
      'itemsid':itemsid
    });
    return response.fold((l) => l, (r) => r);
  }

}
import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ItemsData {
  Curd curd;
  ItemsData(this.curd);

  postData(String id , String userid)async{
    var response =await curd.postData(AppLinks.linkItemsCateogryView, {
      "id":id,
      "userid":userid
    });
    return response.fold((l) => l, (r) => r);
  }
}
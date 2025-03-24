import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class GetCountItems{

  Curd curd;
  GetCountItems(this.curd);

  postData(String userid, String itemsid)async{
    var response=await curd.postData(AppLinks.linkGetCountItems, {
      'userid':userid,
      'itemsid':itemsid
    });
    return response.fold((l) => l, (r) => r);
  }

}
import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ArchiveOrdersData{

  Curd curd;
  ArchiveOrdersData(this.curd);

  postData(String userid )async{
    var response=await curd.postData(AppLinks.linkArchiveOrders ,{
      'userid':userid,
    });
    return response.fold((l) => l, (r) => r);
  }

}
import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ViewAddressData{

  Curd curd;
  ViewAddressData(this.curd);

  postData(String userid )async{
    var response=await curd.postData(AppLinks.linkViewAddress ,{
      'userid':userid,
    });
    return response.fold((l) => l, (r) => r);
  }

}
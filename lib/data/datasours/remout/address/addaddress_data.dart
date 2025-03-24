import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class AddAddressData{

  Curd curd;
  AddAddressData(this.curd);

  postData(String userid, String nameAddress,String citys,String street ,String lat ,String long  )async{
    var response=await curd.postData(AppLinks.linkAddAddress ,{
      'usersid':userid,
      'address_name':nameAddress,
      'citys': citys,
      'street': street,
      'lat': lat ,
      'long': long
    });
    return response.fold((l) => l, (r) => r);
  }

}
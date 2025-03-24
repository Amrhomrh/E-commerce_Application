import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class UpDateAddressData{

  Curd curd;
  UpDateAddressData(this.curd);

  postData(String userid, String nameAddress,String citys,String street ,String addressId  )async{
    var response=await curd.postData(AppLinks.linkUpdateAddress ,{
      'usersid':userid,
      'address_name':nameAddress,
      'citys': citys,
      'street': street,
      'address_id': addressId
    });
    return response.fold((l) => l, (r) => r);
  }

}
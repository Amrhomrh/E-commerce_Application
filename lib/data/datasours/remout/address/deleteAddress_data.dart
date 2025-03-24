import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class DeleteAddressData{

  Curd curd;
  DeleteAddressData(this.curd);

  postData(String addressId )async{
    var response=await curd.postData(AppLinks.linkDeleteAddress ,{
      'address_id':addressId,
    });
    return response.fold((l) => l, (r) => r);
  }

}
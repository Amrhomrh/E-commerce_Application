import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class VerfiyForgetPassword{

  Curd curd;
  VerfiyForgetPassword(this.curd);

  postData(String email , verify)async{

    var response =await curd.postData(AppLinks.linkVerifyCodeforgetpassword, {
      'email':email,
      'verify':verify
    });
    return response.fold((l) => l, (r) => r);

  }

}
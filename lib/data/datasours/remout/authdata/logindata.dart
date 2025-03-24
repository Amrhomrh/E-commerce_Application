import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class LoginData{

  Curd curd;
  LoginData(this.curd);
  postData(String email , String password)async{
    var respons = await curd.postData(AppLinks.linkLogin, {
      'email':email,
      'password':password
    });
    return respons.fold((l) => l, (r) => r);

  }
}
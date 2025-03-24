import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ResetPassword{
  Curd curd;
  ResetPassword(this.curd);

  postData(String email , String password)async{
    var response=await curd.postData(AppLinks.linkResetgetpassword, {
      'email':email,
      'password':password


    });
    return response.fold((l) => l, (r) => r);
  }
}
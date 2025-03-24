import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class VerifySignupData{
  
  Curd curd;
  VerifySignupData(this.curd);
  
  postData(String email,verfiy)async{
    
    var response = await curd.postData(AppLinks.linkVerifySignup, {
      'email':email,
      'verify':verfiy
    });
    return response.fold((l) => l, (r) => r);
  }
}
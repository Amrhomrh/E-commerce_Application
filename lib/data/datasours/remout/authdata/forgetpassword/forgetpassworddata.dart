import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ForgetPasswordData{
  Curd curd;
  ForgetPasswordData(this.curd);
  
  postData(String email)async{
    
    var response =await curd.postData(AppLinks.linkforgetpassword, {
      'email':email
    });
    return response.fold((l) => l, (r) => r);
    
  }
  
}
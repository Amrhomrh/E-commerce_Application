import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class SignupData{
  Curd curd;
  SignupData(this.curd);

  
  postData(String fname,String email,phone , String password)async{
   var response = await curd.postData(AppLinks.linkSignup, {

     'username':fname ,
     'password':password,
     'email':email,
     'phone':phone

   });
   return response.fold((l) => l, (r) => r);
  }
}
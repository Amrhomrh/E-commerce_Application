import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class UpDateUserData {

  Curd curd;

  UpDateUserData(this.curd);

  postData(String userId , String username , String email , String phone)async{
    var response = await curd.postData(AppLinks.linkUpdateUser, {
      "id":userId,
      "username":username,
      "email":email,
      "phone":phone

    });
    return response.fold((l) => l, (r) => r);
  }


}
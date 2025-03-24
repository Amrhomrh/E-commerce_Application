import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ViewUserData {

  Curd curd;

  ViewUserData(this.curd);

  postData(String userId)async{
    var response = await curd.postData(AppLinks.linkViewUser, {
      "id":userId,

    });
    return response.fold((l) => l, (r) => r);
  }


}
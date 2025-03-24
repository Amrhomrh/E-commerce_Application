import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ViewNotificationData{

  Curd curd;
  ViewNotificationData(this.curd);

  postData(String userid )async{
    var response = await curd.postData(AppLinks.linkViewNotification, {
      "userid": userid,

    });
    return response.fold((l) => l,(r)=>r);

  }
}
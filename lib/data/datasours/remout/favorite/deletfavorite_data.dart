import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class DeleteFavorite {
  Curd curd;
  DeleteFavorite(this.curd);

  postData(String userid , String itemsid)async{
    var response =await curd.postData(AppLinks.linkDeleteFavorite, {
      "userid":userid,
      "itemsid":itemsid
    });
    return response.fold((l) => l, (r) => r);
  }
}
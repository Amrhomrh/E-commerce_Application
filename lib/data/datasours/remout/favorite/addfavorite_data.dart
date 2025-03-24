import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class AddFavorite {
  Curd curd;
  AddFavorite(this.curd);

  postData(String userid , String itemsid)async{
    var response =await curd.postData(AppLinks.linkAddFavorite, {
      "userid":userid,
      "itemsid":itemsid

    });
    return response.fold((l) => l, (r) => r);
  }
}
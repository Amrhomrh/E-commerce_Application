import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class ViewFavorite {
  Curd curd;
  ViewFavorite(this.curd);

  postData(String userid )async{
    var response =await curd.postData(AppLinks.linkViewFavorite, {
      "userid":userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
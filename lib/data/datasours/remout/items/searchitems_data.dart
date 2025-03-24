import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class SearchItemsData {
  Curd curd;
  SearchItemsData(this.curd);

  postData(String searchitems)async{
    var response =await curd.postData(AppLinks.linkSearchItems, {
      'searchitems':searchitems,
    });
    return response.fold((l) => l, (r) => r);
  }
}
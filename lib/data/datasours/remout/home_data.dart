import 'package:shoping/core/class/curd.dart';
import 'package:shoping/core/constint/links.dart';

class HomeData {
  Curd curd;
  HomeData(this.curd);
  
  postData()async{
    var response =await curd.postData(AppLinks.linkHomePage, {});
    return response.fold((l) => l, (r) => r);
  }
}
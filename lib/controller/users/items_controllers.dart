
import 'package:get/get.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/handling.dart';
import 'package:shoping/core/servesies/servesies.dart';
import 'package:shoping/data/datasours/remout/items/items_data.dart';
import 'package:shoping/data/modil/items_model.dart';

abstract class ItemsController extends GetxController{

intialData();
onchange(int index , String valCato);
getitems(String catoID);
gotodetails(ItemsMdel itemsMdel);

}
class ItemsControllerImp extends ItemsController{

  ItemsData itemsData = ItemsData(Get.find());
  StutesRequest stutesRequest=StutesRequest.nune;
  List cateogry=[];
  int? selectcate;
  late String catoID;
  List itemsCate=[];
  Myserves myserves=Get.find();

  @override
  intialData() {
    cateogry=Get.arguments['cateogries'];
    selectcate=Get.arguments['selectcate'];
    catoID=Get.arguments['cateogry'];
    getitems(catoID);



  }
  @override

  @override
  void onInit() {

    intialData();
    super.onInit();
  }

  @override
  onchange(index , valCato) {
    selectcate = index;
    catoID = valCato;
    getitems(catoID);
    update();
  }



  @override
  getitems(catoID) async{
    itemsCate.clear();
    stutesRequest= StutesRequest.loading;
    update();
    var response = await itemsData.postData(catoID as String , myserves.sharedpreferences.getString("user_id")! );
    stutesRequest=handling(response);
    if(stutesRequest == StutesRequest.success){
      if(response["stutes"] == "success"){
      itemsCate.addAll(response["data"]);
    }
      else{

        stutesRequest=StutesRequest.failure;
      }update();
      }
  }

  @override
  gotodetails(itemsMdel) {
    Get.toNamed("/productDetails" , arguments: {
      "product":itemsMdel,
    });
  }

}
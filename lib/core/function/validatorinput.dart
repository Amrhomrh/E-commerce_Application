 import 'package:get/get_utils/get_utils.dart';

validInput(String val,int min,int max,String type){
  if(type == "username"){
    if(!GetUtils.isUsername(val)){
      return "Not vaild username";
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "Not vail email";
    }
  }

  if(type =="phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "Not vail phone";
    }
  }

 if(val.isEmpty){
   return "can't be empty";
 }

  if(val.length < min){
    return "can't be less than $min";
  }

  if(val.length > max){
    return "can't be larger than $max";
  }




}
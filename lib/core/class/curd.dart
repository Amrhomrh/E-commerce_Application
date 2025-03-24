import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/function/chickinternet.dart';
import 'package:http/http.dart' as http;
class Curd{


  Future< Either< StutesRequest,Map>> postData(String url , Map data)async{
    // if(await CheckInternet()){
      var response = await http.post(Uri.parse(url),body: data);
      if(response.statusCode==200 || response.statusCode==201 ){
        Map responsebody=jsonDecode(response.body);
        return Right(responsebody);
      }
      else{
        return const Left(StutesRequest.serverfailure);
      }
    // }
    // else{
    //   return const Left(StutesRequest.offline);
    // }

  }



}
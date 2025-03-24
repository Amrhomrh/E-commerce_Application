import 'package:shoping/core/class/stutesRequest.dart';

handling(response){
  if(response is StutesRequest){
    return response;

  }
  else{
    return StutesRequest.success;
  }
}
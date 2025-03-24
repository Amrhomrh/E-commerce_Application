import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shoping/core/class/stutesRequest.dart';
import 'package:shoping/core/constint/images.dart';
class HandlingDataView extends StatelessWidget {
    StutesRequest stutesRequest  ;
    Widget widget;
   HandlingDataView({super.key, required this.stutesRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return stutesRequest == StutesRequest.loading?
        Center(child: Lottie.asset(imagesAssets.loading),)
    :stutesRequest == StutesRequest.offline?
    Center(child: Lottie.asset(imagesAssets.offline),)
    :  stutesRequest == StutesRequest.serverfailure?
    Center(child: Lottie.asset(imagesAssets.offline),)
    :stutesRequest == StutesRequest.failure?
    Center(child: Lottie.asset(imagesAssets.nodata),)
    :widget;
  }
}
class HandlingDataRquest extends StatelessWidget {
  StutesRequest stutesRequest  ;
  Widget widget;
  HandlingDataRquest({super.key, required this.stutesRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return stutesRequest == StutesRequest.loading?
    Center( child: Lottie.asset(imagesAssets.loading,),)
        :stutesRequest == StutesRequest.offline?
    Center(child: Lottie.asset(imagesAssets.offline),)
        : stutesRequest == StutesRequest.serverfailure?
    Center(child: Lottie.asset(imagesAssets.nodata),)
      :widget;
  }
}
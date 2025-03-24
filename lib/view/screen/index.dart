import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/index_controller.dart';
import 'package:shoping/core/constint/color.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IndexControllerImp());

    return GetBuilder<IndexControllerImp>(
        builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.Icons1,
            onPressed: (){
              Get.toNamed("/cart");
            },
            child: Icon(Icons.shopping_cart_rounded,color: AppColor.Icons2,),
          ),
              // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


              body: controller.Page.elementAt(controller.curentPage),



              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: AppColor.background,
                selectedItemColor: AppColor.primaryColor,
                unselectedItemColor: AppColor.Icons1,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline_outlined),
                    label: 'Favorites',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'settings',
                  ),

                ],
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                currentIndex: controller.curentPage,
                onTap: (value) {
                 controller.chargePage(value);
                },
              ),
            ));
  }
}

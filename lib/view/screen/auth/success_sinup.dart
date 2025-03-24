import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/constint/color.dart';
class SuccessSinup extends StatelessWidget {
  const SuccessSinup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text("Success",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color:Colors.black),
        )
        
        ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Center(
            child:Icon(Icons.check_circle,size: 300,color: Colors.green,),
            ),
            MaterialButton(onPressed: (){
              Get.offNamed("login");
            },
              color: AppColor.primaryColor,
              child: Text("Go to login",style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
            )
          ],
        ),
      ),
     );
  }
}

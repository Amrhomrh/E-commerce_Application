import 'package:flutter/material.dart';
import 'package:shoping/core/constint/color.dart';
class custombuttom extends StatelessWidget {
  final String titilebutton;
  final void Function()?onPressed;
  const custombuttom({super.key , required this.titilebutton , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      // margin: EdgeInsets.symmetric(horizontal: 50),
      color: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      // decoration: BoxDecoration(
      // ),
      child: Center(
        child: Text(
          "$titilebutton",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

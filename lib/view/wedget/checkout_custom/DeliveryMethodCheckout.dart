import 'package:flutter/material.dart';
import 'package:shoping/core/constint/color.dart';
class DeliveryMethodCheckOut extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool Active;
  const DeliveryMethodCheckOut({super.key, required this.icon, required this.Active, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Active == true? AppColor.primaryColor : Colors.white ,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: Active == true?Colors.white:AppColor.primaryColor,
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Active == true?Colors.amber[700] : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoping/core/constint/color.dart';
class AddressCartCheckOut extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool active;
  const AddressCartCheckOut({super.key, required this.title, required this.subtitle, required this.active});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: active == true ? AppColor.primaryColor:Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold ,color: active==true ? Colors.white:Colors.black),
        ),
        subtitle: Text(subtitle , style: TextStyle(
          color: active == true ?Colors.amber[700] : Colors.grey
        ),),
        trailing: Icon(Icons.location_on, color:active == true ?Colors.amber[700] : AppColor.primaryColor),
      ),
    );
  }
}

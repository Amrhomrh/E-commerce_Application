import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController mycontroller;
  void Function() onPressed;
  void Function(String)? onChanged;
   CustomAppBar({super.key , required this.onPressed , this.onChanged, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.teal[600],
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(onPressed:onPressed, icon: Icon(Icons.search, color: Colors.grey),),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: mycontroller,
                        onChanged:onChanged ,
                        decoration: InputDecoration(
                          hintText: 'Search for products...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16),
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Get.offNamed("/favorites");
                    },
                    icon: (Icon(Icons.favorite_outline_outlined,
                        color: Colors.white, size: 28))),
                Positioned(
                  right: 4,
                  top: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed("/notification");
                    },
                    icon: (Icon(Icons.notifications_none_outlined,
                        color: Colors.white, size: 28))),
                Positioned(
                  right: 4,
                  top: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

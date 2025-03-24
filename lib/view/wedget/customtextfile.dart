import 'package:flutter/material.dart';
import 'package:shoping/core/constint/color.dart';
class customtextfile extends StatelessWidget {

  final String titile;
  final IconData? icondata;
  final TextEditingController myController;
  final String? Function(String?)? vaild;
  final void Function()? onTapIcon;
  final bool Keybordnum;
  final bool? scurtypas;


  const customtextfile({super.key,required this.titile, required this.myController,required this.vaild, required this.Keybordnum,this.scurtypas, this.icondata,this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white))
      ),
      child: TextFormField(
        style: TextStyle(
          color: AppColor.Textform
        ),
        cursorColor: Colors.white,
        keyboardType: Keybordnum?TextInputType.numberWithOptions(decimal: true):TextInputType.text,
        obscureText: scurtypas==null || scurtypas == false ?false:true,
        validator:vaild ,
        controller: myController,
        decoration: InputDecoration(
            hintText: "$titile",
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: InkWell(
              child:Icon(icondata,color: Colors.white,),
              onTap:onTapIcon ,
            ),
            border: InputBorder.none
        ),

      ),
    );
  }
}

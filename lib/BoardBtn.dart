import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoardBtn extends StatelessWidget {
  String title; // "" , "x" , "o"
  void Function(int) onClick;
  int index;
  BoardBtn({required this.title,required this.onClick,required this.index});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
         onClick(index);
        },
        child: Container(
          child: title.isEmpty
              ?null
              :SvgPicture.asset(title=="x"
              ?"assets/images/x_icon.svg"
              :"assets/images/o_icon.svg",
            height: 68,
            width: 68,
          ),
        ),
      ),
    );
  }
}

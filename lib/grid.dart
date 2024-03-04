import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:appstest/style/colors.dart';


class grid extends StatefulWidget {
  const grid({super.key});

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: GridView.builder(
        itemCount: 9,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6
        ),
        itemBuilder: (BuildContext context, int index) {
          return (
              box(index)
          );
        },

      ),
    );
  }
}
Widget box(index){
  return (
      Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: colorApp.colorPrimary,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Text(
          '$index',
          style: TextStyle(fontFamily: 'Poppins-SemiBold',fontSize: 20,color: colorApp.colorBackground),
        ),)
  );
}

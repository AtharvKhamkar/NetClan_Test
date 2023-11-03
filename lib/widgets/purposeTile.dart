// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:netclan_test/constants/colorConstant.dart';

class purposeTile extends StatelessWidget {
  final String tile;
  final Color selectedColor;
  final Color textColor;
  const purposeTile({
    Key? key,
    required this.tile,
    required this.selectedColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      width: MediaQuery.of(context).size.width / 6,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor, width: 1.5),
        color: selectedColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
          child: Text(
        tile,
        style: TextStyle(
            color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
      )),
    );
  }
}

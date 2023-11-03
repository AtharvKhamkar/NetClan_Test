import 'package:flutter/material.dart';
import 'package:netclan_test/constants/colorConstant.dart';

class aboutTextFieldWidget extends StatelessWidget {
  final String about;
  final String hintText;
  final TextEditingController controller;
  aboutTextFieldWidget({
    Key? key,
    required this.about,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          about,
          style: const TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 17,
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.secondaryColor, width: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.secondaryColor, width: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

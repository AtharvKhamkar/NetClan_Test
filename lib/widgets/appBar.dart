import 'package:flutter/material.dart';
import 'package:netclan_test/constants/colorConstant.dart';


customAppBar(
    String title, String location, BuildContext context, Widget pageName,
    {List<Widget>? actions}) {
  return AppBar(
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
    backgroundColor: AppColors.primaryColor,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: AppColors.whiteColor, fontSize: 20),
        ),
        Text(
          location,
          style: const TextStyle(color: AppColors.whiteColor, fontSize: 16),
        )
      ],
    ),
    actions: [
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: IconButton(
              icon: Image.asset(
                "assets/refine.png",
                color: AppColors.whiteColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pageName),
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:netclan_test/constants/colorConstant.dart';

class userCard extends StatelessWidget {
  final String name;
  final String location;
  final String role;
  final int distance;
  final String about;
  const userCard({
    Key? key,
    required this.name,
    required this.location,
    required this.role,
    required this.distance,
    required this.about,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          child: const Card(
            color: AppColors.whiteColor,
            elevation: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "+INVITE",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.initialCard,
              ),
              child: Center(
                child: Text(
                  name.substring(0, 1),
                  style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 75,
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  location + " | " + role,
                  style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Within  ${distance} - ${distance + 100} m",
                  style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    tags(tag: "Coffee | "),
                    tags(tag: "Business | "),
                    tags(tag: "Friendship ")
                  ],
                ),
                Text(
                  about,
                  style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

class tags extends StatelessWidget {
  final String tag;
  const tags({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      tag,
      style: const TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w500),
    );
  }
}

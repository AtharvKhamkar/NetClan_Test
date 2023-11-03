import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netclan_test/constants/colorConstant.dart';
import 'package:netclan_test/views/exploreScreen.dart';
import 'package:netclan_test/widgets/appBar.dart';
import 'package:netclan_test/widgets/customDrawer.dart';
import 'package:netclan_test/widgets/userCard.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/userProfiles.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["users"];
    });
  }

  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar("Atharv Khamkar", "Pune", context, const refineScreen()),
      drawer: customDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: AppColors.secondaryColor,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                  padding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.whiteColor,
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: AppColors.whiteColor,
                  unselectedLabelColor: Colors.white30,
                  tabs: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: const Tab(
                        text: "Personal",
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: const Tab(text: "Business")),
                    Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: const Tab(text: "Merchant"))
                  ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: searchController,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.black38,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.blackColor,
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.blackColor,
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  hintText: "Search",
                                  hintStyle: const TextStyle(
                                      fontSize: 14, color: Colors.black38),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/setting.png",
                                color: AppColors.secondaryColor,
                              ))
                        ]),
                  ),
                  _items.isNotEmpty
                      ? Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                itemCount: _items.length,
                                itemBuilder: (context, index) {
                                  return userCard(
                                      name: _items[index]["name"],
                                      location: _items[index]["location"],
                                      role: "Student",
                                      distance: 200,
                                      about: _items[index]["status"]);
                                }),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

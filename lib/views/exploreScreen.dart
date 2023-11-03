// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:netclan_test/constants/colorConstant.dart';
import 'package:netclan_test/controllers/valuesController.dart';
import 'package:netclan_test/widgets/purposeTile.dart';
import 'package:netclan_test/widgets/textFormFields.dart';
import 'package:get/get.dart';

class refineScreen extends StatefulWidget {
  const refineScreen({super.key});

  @override
  State<refineScreen> createState() => _refineScreenState();
}

class _refineScreenState extends State<refineScreen>
    with TickerProviderStateMixin {
  TextEditingController availabilityController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  final valueController distanceController = Get.put(valueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Refine Screen",
          style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aboutTextFieldWidget(
                about: "Select Your Availability",
                hintText: "Available ! Hey Let Us Connect",
                controller: availabilityController),
            aboutTextFieldWidget(
                about: "Add Your Status",
                hintText: "Hi community ! I am open to new connections",
                controller: statusController),
            const Text(
              "Select Hyper local Distance",
              style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            Obx(
              () => Slider(
                value: distanceController.distance.value,
                onChanged: (value) {
                  distanceController.setDistance(value);
                },
                divisions: 100,
                label: distanceController.distance.value.toStringAsFixed(1),
                min: 0.0,
                max: 100.0,
                activeColor: AppColors.secondaryColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("0"), Text("100")],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "select Purpose",
              style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: distanceController.purposeList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                      () => InkWell(
                        onTap: () {
                          if (distanceController.addedPurpose.contains(
                            distanceController.purposeList[index].toString(),
                          )) {
                            distanceController.removeFromList(
                              distanceController.purposeList[index].toString(),
                            );
                          } else {
                            distanceController.addToPurposeList(
                              distanceController.purposeList[index].toString(),
                            );
                          }
                          print(distanceController.addedPurpose);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 25, bottom: 20),
                          child: purposeTile(
                            tile: distanceController.purposeList[index],
                            selectedColor: distanceController.addedPurpose
                                    .contains(distanceController
                                        .purposeList[index]
                                        .toString())
                                ? AppColors.secondaryColor
                                : AppColors.whiteColor,
                            textColor: distanceController.addedPurpose.contains(
                                    distanceController.purposeList[index]
                                        .toString())
                                ? Colors.white
                                : AppColors.secondaryColor,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Text(
                      "Save & Explore",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

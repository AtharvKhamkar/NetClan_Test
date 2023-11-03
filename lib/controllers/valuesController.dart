import 'package:get/get.dart';

class valueController extends GetxController {
  RxDouble distance = 0.0.obs;
  RxList<String> purposeList = [
    'Coffee',
    'Business',
    'Hobbies',
    'Friendship',
    'Movies',
    'Dinning',
    'Dating',
    'Matrimony'
  ].obs;

  RxList<dynamic> addedPurpose = [].obs;

  incrementCounter() {
    distance.value++;
    print(distance.value);
  }

  setDistance(double value) {
    distance.value = value;
  }

  addToPurposeList(String value) {
    addedPurpose.add(value);
  }

  removeFromList(String value) {
    addedPurpose.remove(value);
  }
}

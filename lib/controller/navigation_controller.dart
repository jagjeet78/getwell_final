import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt currentPage = 0.obs;

  void select(int index) {
    currentPage.value = index;
  }
}

import 'package:get/get.dart';

class QuestionPageController extends GetxController {
  // 1. Make the variable reactive with .obs
  final sliderval = 26.0.obs;

  // 2. This method will now work correctly because sliderval is an RxDouble.
  //    (Also corrected the method name to match what's called in the UI)
  void updateSliderValue(double newValue) {
    sliderval.value = newValue;
  }
}
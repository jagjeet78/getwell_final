import 'package:get/get.dart';

class QuestionPageController extends GetxController {
  // Reactive variables for state
  var gender = ''.obs;
  final sliderval = 26.0.obs;

  // Checks if the stored gender matches the input string.
  bool isGenderSelected(String input) {
    return gender.value == input;
  }

  // --- IMPROVED GENDER SELECTION LOGIC ---
  // This single method handles both selecting and deselecting a gender.
  void toggleGender(String newGender) {
    if (isGenderSelected(newGender)) {
      // If the user taps the same gender box again, deselect it.
      gender.value = '';
    } else {
      // Otherwise, select the new gender.
      gender.value = newGender;
    }
  }

  // Method to update the slider value
  void updateSliderValue(double newValue) {
    sliderval.value = newValue;
  }
}

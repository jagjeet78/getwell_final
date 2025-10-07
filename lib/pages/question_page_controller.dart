import 'package:get/get.dart';

class QuestionPageController extends GetxController {
  // Reactive variables for state
  var gender = ''.obs;
  final sliderval = 26.0.obs;
  RxInt progress = 0.obs;
  var fullName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _updateProgress(); // Calculate initial progress
  }

  void progresincrease() {
    progress.value++;
  }

  void progresdeccrease() {
    progress.value--;
  }

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
    _updateProgress(); // Update progress when gender changes
  }

  // Method to update the slider value
  void updateSliderValue(double newValue) {
    sliderval.value = newValue;
    // Age changes don't affect progress anymore
  }

  // Method to update the full name
  void updateFullName(String name) {
    fullName.value = name;
    _updateProgress(); // Update progress when name changes
  }

  // Private method to automatically calculate and update progress
  void _updateProgress() {
    int completedFields = 0;

    // Check if full name is not empty
    if (fullName.value.trim().isNotEmpty) {
      completedFields++;
    }

    // Check if gender is selected
    if (gender.value.isNotEmpty) {
      completedFields++;
    }

    // Update progress (0-2 based on completed fields)
    progress.value = completedFields;
  }
}

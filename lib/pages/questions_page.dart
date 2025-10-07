import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwell_final/Routes/app_routes.dart';
import 'package:getwell_final/componets/slider.dart';
import 'package:getwell_final/pages/question_page_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import '../componets/ProgressBarSlider.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  // This private helper method builds a single gender selection box,

  @override
  Widget build(BuildContext context) {
    final QuestionPageController questionController = Get.put(
      QuestionPageController(),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome ",
                      style: GoogleFonts.manrope(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF121417),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Obx(
                () => ProgressBarSlider(
                  progress: questionController.progress.value.toDouble() / 2.0,
                  divisions: 3,
                ),
              ),

              SizedBox(height: Get.height * 0.25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "Tell us about yourself",
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: Get.height * 0.04),
                    TextField(
                      onChanged: (value) =>
                          questionController.updateFullName(value),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Full Name",
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(
                                  "Age: ",
                                  style: GoogleFonts.manrope(fontSize: 16),
                                ),
                              ),
                              Text(
                                questionController.sliderval.value
                                    .toInt()
                                    .toString(),
                                style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Slider(
                            activeColor: Color(0xFFe0f2fe),
                            thumbColor: Color(0xFf0d80f2),
                            inactiveColor: Color(0xFFe0f2fe),
                            value: questionController.sliderval.value,
                            min: 1,
                            max: 150,
                            divisions: 150,
                            onChanged: (value) {
                              questionController.updateSliderValue(value);
                            },
                          ),
                        ],
                      ),
                    ),

                    Row(children: [Text("Gender :")]),
                    SizedBox(height: Get.height * 0.02),
                    Obx(
                      () => Row(
                        children: [
                          // Calling the helper method for each gender
                          _buildGenderSelectionBox(
                            controller: questionController,
                            label: "Male",
                            icon: Icons.male,
                            genderValue: "male",
                          ),

                          SizedBox(width: Get.width * 0.03),
                          _buildGenderSelectionBox(
                            controller: questionController,
                            label: "Female",
                            icon: Icons.female,
                            genderValue: "female",
                          ),
                          SizedBox(width: Get.width * 0.03),
                          _buildGenderSelectionBox(
                            controller: questionController,
                            label: "Other",
                            icon: Icons.transgender,
                            genderValue: "other",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.homepage);
                },
                child: const Text('Skip', style: TextStyle(fontSize: 16)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle next logic
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // making the main build method much cleaner.
  Widget _buildGenderSelectionBox({
    required QuestionPageController controller,
    required String label,
    required IconData icon,
    required String genderValue,
  }) {
    final bool isSelected = controller.isGenderSelected(genderValue);

    // Define colors based on selection state
    final Color activeColor = Color(0xFF0d80f2);
    final Color inactiveColor = Color(0xFF0d80f2).withOpacity(0.6);
    final Color activeBorderColor = Color(0xFF4d91f2);
    final Color inactiveBorderColor = Color(0xFF4d91f2).withOpacity(0.7);
    final Color activeBgColor = Color(0xFFe0f2fe);
    final Color inactiveBgColor = Color(0xFFe0f2fe).withOpacity(0.7);

    return GestureDetector(
      // The whole container is now tappable and calls the correct method.
      onTap: () => controller.toggleGender(genderValue),
      child: Container(
        height: Get.height * 0.12,
        width: Get.width * 0.22,
        decoration: BoxDecoration(
          color: isSelected ? activeBgColor : inactiveBgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? activeBorderColor : inactiveBorderColor,
            width: isSelected ? 3 : 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 49.0,
              color: isSelected ? activeColor : inactiveColor,
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: GoogleFonts.manrope(
                color: isSelected ? activeColor : inactiveColor,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

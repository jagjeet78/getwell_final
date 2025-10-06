import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwell_final/pages/question_page_controller.dart';
// import 'package:getwell_final/themes/app_fonts.dart'; // Assuming this is your font file
import 'package:google_fonts/google_fonts.dart';

// No need for a StatefulWidget anymore, GetX handles the state.
class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize your controller. Get.put() creates a new instance.
    final QuestionPageController controller = Get.put(QuestionPageController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // Added to prevent overflow on small screens
          child: Column(
            children: [
              ///  CODR FOR THE UPPER WELCOME TEXT HERE
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

              // CODE FOR THE IMAGE SHOWN HERE TO BE THE LIKE DYNAMIC
              SizedBox(height: Get.height * 0.3), // Adjusted height slightly

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

                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Full Name",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ), // Using fixed height is often better
                    // --- KEY CHANGE AREA ---
                    // Obx will automatically rebuild its children when sliderval changes.
                    Obx(
                      () => Column(
                        children: [
                          // This row now shows the reactive value of the age
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
                              // 1. Display the slider's value.
                              //    .toInt() converts the double (e.g., 25.0) to an integer (25).
                              Text(
                                controller.sliderval.value.toInt().toString(),
                                style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // This is the code for the slider
                          Slider(
                            activeColor: Color(0xFFe0f2fe),
                            thumbColor: Color(0xFf0d80f2),
                            inactiveColor: Color(0xFFe0f2fe),

                            // 2. Set the slider's properties
                            value: controller.sliderval.value,
                            min: 1, // Set a minimum age
                            max: 150, // Set a maximum agex
                            divisions: 150, // Creates steps for each year
                            // 3. When the slider is moved, call the controller's method
                            onChanged: (value) {
                              controller.updateSliderValue(value);
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: Get.height * 0.02),

                    Row(),







                    // bottom rows of the buttons of the skip and the next button and the all things here 

                  
                    
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
              // Using TextButton for a less prominent "skip" action
              TextButton(
                onPressed: () {
                  // Handle skip logic
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // Using ElevatedButton for the primary "next" action
              ElevatedButton(
                onPressed: () {
                  // Handle next logic
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

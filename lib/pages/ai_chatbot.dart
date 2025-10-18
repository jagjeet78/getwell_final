import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/themes/app_color.dart';
import 'package:get/get.dart';
class AiChatbotScreen extends StatefulWidget {
  const AiChatbotScreen({super.key});

  @override
  State<AiChatbotScreen> createState() => _AiChatbotScreenState();
}

class _AiChatbotScreenState extends State<AiChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // ✅ clean background
        appBar: AppBar(
          backgroundColor: Colors.white,
                 automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'MED AI',
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),

        body: Column(
          children: [
            // ✅ Expanded chat area
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ListView(
                  children: [
                    // 🔹 BOT Message (LEFT)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.only(
                              top: 20,
                            ),
                            child: CircleAvatar(
                              backgroundColor: AppColor.activeColor.withOpacity(0.1),
                              radius: 15,
                              child: Icon(Icons.smart_toy,
                                  color: AppColor.activeColor, size: 20),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Container(
                              width: Get.width * 0.6,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Hi! I’m MedAI, how can I help you today?",
                                style: GoogleFonts.manrope(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 🔹 USER Message (RIGHT)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                         
                          Flexible(
                            child: Container(
                              width: Get.width * 0.6,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColor.activeColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "I need help understanding my prescription.in the punjabi ",
                                style: GoogleFonts.manrope(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                         
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ✅ Message input field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 5,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: GoogleFonts.manrope(fontSize: 15),
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: GoogleFonts.manrope(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColor.activeColor,
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

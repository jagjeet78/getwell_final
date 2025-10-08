import 'package:flutter/material.dart';

class AiChatbotScreen extends StatefulWidget {
  const AiChatbotScreen({super.key});

  @override
  State<AiChatbotScreen> createState() => _AiChatbotScreenState();
}

class _AiChatbotScreenState extends State<AiChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: Column(
          children: [
            Text("hi i am chatbot screen"),
          ],
        ),
      
      ),
    );
  }
}
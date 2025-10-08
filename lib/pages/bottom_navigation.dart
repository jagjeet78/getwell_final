import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwell_go/pages/Home_page.dart';
import 'package:getwell_go/pages/ai_chatbot.dart';
import 'package:getwell_go/pages/appointments.dart';
import 'package:getwell_go/pages/profile_page.dart';
import '/controller/navigation_controller.dart';
import '/themes/app_color.dart';
import '/customiconpack.dart';

class BottomNavExample extends StatelessWidget {
  BottomNavExample({super.key});

  final NavigationController _navigationController = Get.put(
    NavigationController(),
  );

  final List<Widget> _pages = [
    Center(child: HomePage()),
    Center(child: AppointmentsScreen()),
    Center(child: AiChatbotScreen()),
    Center(child: ProfilePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _pages[_navigationController.currentPage.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navigationController.currentPage.value,
          onTap: _navigationController.select,
          selectedItemColor: AppColor.activeColor,
          unselectedItemColor: Colors.black.withOpacity(0.65),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,

                semanticLabel: 'Home Icon',
                textDirection: TextDirection.ltr,
              ),
              activeIcon: Icon(
                Icons.home,
                // selected color
                size: 33, // bigger size for selected
              ),

              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month, textDirection: TextDirection.ltr),
              activeIcon: Icon(
                Icons.calendar_month,
                // selected color
                size: 33, // bigger size for selected
              ),
              label: 'Appointments',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy),
              activeIcon: Icon(
                Icons.smart_toy,
                // selected color
                size: 33, // bigger size for selected
              ),
              label: 'MedAi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(
                Icons.person,
                // selected color
                size: 33, // bigger size for selected
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

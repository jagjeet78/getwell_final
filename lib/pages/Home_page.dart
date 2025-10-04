import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Only if you use GetX for navigation

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to the Home Page!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                // Example button action
                Get.snackbar(
                  "Hello",
                  "This is a sample button action",
                  backgroundColor: Colors.blue,
                  colorText: Colors.white,
                );
              },
              child: const Text("Click Me"),
            ),
            
            const SizedBox(height: 30),

            const Text(
              "Sample List:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            // Example list
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.star),
                      title: Text("Item ${index + 1}"),
                      subtitle: const Text("This is a sample item"),
                      onTap: () {
                        Get.snackbar(
                          "Tapped",
                          "You tapped Item ${index + 1}",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

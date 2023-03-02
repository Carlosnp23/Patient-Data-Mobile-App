import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("Residents"),
              onPressed: () {
                // Navigation to the residents.
              },
            ),
            ElevatedButton(
              child: const Text("Medical Records"),
              onPressed: () {
                // Navigation to Medical Records.
              },
            ),
            ElevatedButton(
              child: const Text("Logout"),
              onPressed: () {
                // Log out.
              },
            )
          ],
        ),
      ),
    );
  }
}

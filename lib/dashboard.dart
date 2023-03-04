import 'dart:io';

import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Medical%20Records/medicalrecords.dart';
import 'package:patient_data_mobileapp/Residents/residents.dart';

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
//
            const SizedBox(
              height: 200,
            ),
//
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              child: const Text("Residents"),
              onPressed: () {
                // Navigation to the residents.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Residents()));
              },
            ),
//
            const SizedBox(
              height: 20,
            ),
//
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              child: const Text("Medical Records"),
              onPressed: () {
                // Navigation to Medical Records.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Medical_Records()));
              },
            ),
//
            const SizedBox(
              height: 120,
            ),
//
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              child: const Text("Logout"),
              onPressed: () {
                // Log out.
                exit(0);
              },
            )
          ],
        ),
      ),
    );
  }
}

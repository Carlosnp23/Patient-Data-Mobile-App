import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Medical%20Records/medicalrecords.dart';
import 'package:patient_data_mobileapp/Residents/residents.dart';
import 'package:patient_data_mobileapp/main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
//
            const SizedBox(
              height: 200,
            ),
//
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              icon: const Icon(Icons.people_alt),
              label: const Text("Residents"),
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
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              icon: const Icon(Icons.library_books),
              label: const Text("Medical Records"),
              onPressed: () {
                // Navigation to Medical Records.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Medical_Records()));
              },
            ),
//
            const SizedBox(
              height: 120,
            ),
//
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Logout"),
              onPressed: () {
                // Log out.
                FirebaseAuth.instance.signOut();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}

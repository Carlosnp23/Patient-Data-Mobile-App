import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Blood%20Oxygen%20Level/bloodoxygenlevel.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Blood%20Pressure/bloodpressure.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Heart%20Beat%20Rate/heartbeatrate.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Respiratory%20Rate/respiratoryrate.dart';

// ignore: camel_case_types
class Medical_Records extends StatelessWidget {
  const Medical_Records({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Records"),
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
              child: const Text("Blood Pressure"),
              onPressed: () {
                // Navigation to Blood Pressure.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Blood_Pressure()));
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
              child: const Text("Respiratory Rate"),
              onPressed: () {
                // Navigation to Respiratory Rate.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Respiratory_Rate()));
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
              child: const Text("Blood Oxygen Level"),
              onPressed: () {
                // Navigation to Blood Oxygen Level.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Blood_Oxygen_Level()));
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
              child: const Text("Heart Beat Rate"),
              onPressed: () {
                // Navigation to Heart Beat Rate.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Heart_Beat_Rate()));
              },
            )
          ],
        ),
      ),
    );
  }
}

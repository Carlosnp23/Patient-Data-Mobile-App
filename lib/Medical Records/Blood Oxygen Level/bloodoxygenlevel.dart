import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Blood%20Oxygen%20Level/addborecord.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Blood%20Oxygen%20Level/bolist.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Blood%20Oxygen%20Level/editborecord.dart';

// ignore: camel_case_types
class Blood_Oxygen_Level extends StatelessWidget {
  const Blood_Oxygen_Level({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Oxygen Level"),
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
              child: const Text("Add BO Record"),
              onPressed: () {
                // Navigation to Add BO Record.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Add_BO_Record()));
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
              child: const Text("Edit BO Record"),
              onPressed: () {
                // Navigation to Edit BO Record.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Edit_BO_Record()));
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
              child: const Text("BO Lsit"),
              onPressed: () {
                // Navigation to BO Lsit.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BO_List()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

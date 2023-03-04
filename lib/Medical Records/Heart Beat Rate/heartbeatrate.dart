import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Heart%20Beat%20Rate/addheartbpmrecord.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Heart%20Beat%20Rate/bpmlist.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Heart%20Beat%20Rate/editbpmrecord.dart';

// ignore: camel_case_types
class Heart_Beat_Rate extends StatelessWidget {
  const Heart_Beat_Rate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Beat Rate"),
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
              child: const Text("Add Heart BPM Record"),
              onPressed: () {
                // Navigation to Add Heart BPM Record.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Add_Heart_beat_BPM_Record()));
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
              child: const Text("Edit BPM Record"),
              onPressed: () {
                // Navigation to Edit BPM Record.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Edit_BPM_Record()));
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
              child: const Text("BPM Lsit"),
              onPressed: () {
                // Navigation to BPM Lsit.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BPM_List()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

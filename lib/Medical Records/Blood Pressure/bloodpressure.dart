import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Blood%20Pressure/addbprecord.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Blood%20Pressure/bplist.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Blood%20Pressure/editbprecord.dart';

// ignore: camel_case_types
class Blood_Pressure extends StatelessWidget {
  const Blood_Pressure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Pressure"),
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
              child: const Text("Add BP Record"),
              onPressed: () {
                // Navigation to Add BP Record.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Add_BP_Record()));
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
              child: const Text("Edit BP Record"),
              onPressed: () {
                // Navigation to Edit BP Record.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Edit_BP_Record()));
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
              child: const Text("BP Lsit"),
              onPressed: () {
                // Navigation to BP Lsit.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BP_List()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

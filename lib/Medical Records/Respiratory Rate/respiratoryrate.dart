import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Respiratory%20Rate/addrprecord.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Respiratory%20Rate/editrprecord.dart';
import 'package:patient_data_mobileapp/Medical%20Records/Respiratory%20Rate/rplist.dart';

// ignore: camel_case_types
class Respiratory_Rate extends StatelessWidget {
  const Respiratory_Rate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Respiratory Rate"),
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
              child: const Text("Add RP Record"),
              onPressed: () {
                // Navigation to Add RP Record.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Add_RP_Record()));
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
              child: const Text("Edit RP Record"),
              onPressed: () {
                // Navigation to Edit RP Record.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Edit_RP_Record()));
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
              child: const Text("RP Lsit"),
              onPressed: () {
                // Navigation to RP Lsit.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RP_List()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

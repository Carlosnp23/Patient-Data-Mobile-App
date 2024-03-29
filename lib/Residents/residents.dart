import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Residents/addresidents.dart';
import 'package:patient_data_mobileapp/Residents/editresidents.dart';
import 'package:patient_data_mobileapp/Residents/viewresidents.dart';

class Residents extends StatelessWidget {
  const Residents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Residents"),
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
              icon: const Icon(Icons.add),
              label: const Text("Add Residents"),
              onPressed: () {
                // Navigation to Add residents.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Add_Residents()));
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
              icon: const Icon(Icons.edit),
              label: const Text("Edit Residents"),
              onPressed: () {
                // Navigation to Edit Residents.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Edit_Residents()));
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
              icon: const Icon(Icons.list_alt),
              label: const Text("Resident List"),
              onPressed: () {
                // Navigation to Resident List.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => View_Resident()));
              },
            )
          ],
        ),
      ),
    );
  }
}

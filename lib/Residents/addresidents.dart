import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Residents/residents.dart';
import 'package:patient_data_mobileapp/patientModel.dart';

// ignore: camel_case_types
class Add_Residents extends StatelessWidget {
  Add_Residents({super.key});

  final _textName = TextEditingController();
  final _textAge = TextEditingController();
  final _textAddress = TextEditingController();
  final _textEmergencyContact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Residents"),
      ),
      body: Center(
        child: Column(
          children: [
//
            const SizedBox(
              height: 20,
            ),
//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _textName,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Name"),
                  hintText: "Name",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textName.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
//
            const SizedBox(
              height: 10,
            ),
//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _textAge,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Age"),
                  hintText: "Age",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textAge.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
//
            const SizedBox(
              height: 10,
            ),
//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _textEmergencyContact,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Emergency Contact"),
                  hintText: "Emergency Contact",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textEmergencyContact.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
//
            const SizedBox(
              height: 10,
            ),
//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _textAddress,
                keyboardType: TextInputType.streetAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Address"),
                  hintText: "Address",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textAddress.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
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
              child: const Text("SAVE"),
              onPressed: () {
                // SAVE

                final name = _textName.text;
                final age = int.parse(_textAge.text);
                final contact = int.parse(_textEmergencyContact.text);
                final address = _textAddress.text;

                // Create Patient
                createPatient(
                    name: name, age: age, contact: contact, address: address);

                // Navigation to Add residents.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Residents()));
              },
            )
          ],
        ),
      ),
    );
  }

  Future createPatient(
      {required String name,
      required int age,
      required int contact,
      required String address}) async {
    // Reference to Document
    final docPatient = FirebaseFirestore.instance.collection('Patient').doc();

    final patient = Patient(
        id: docPatient.id,
        name: name,
        age: age,
        emergency_contact: contact,
        address: address); // Patient

    final json = patient.toJson();

    // Create document and write data to FireBase
    await docPatient.set(json);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/patientModel.dart';

// ignore: camel_case_types
class View_Resident extends StatelessWidget {
  const View_Resident({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Residents"),
      ),
      //    body: _buildListView(context),

      body: StreamBuilder<List<Patient>>(
          stream: readPatients(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final patients = snapshot.data!;

              return ListView(
                children: patients.map(buildPatient).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildPatient(Patient patient) => ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(patient.name),
        subtitle: Text(patient.address),
        onTap: () {},
      );

  Stream<List<Patient>> readPatients() => FirebaseFirestore.instance
      .collection('Patient')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Patient.fromJson(doc.data())).toList());
}

/*
ListView _buildListView(BuildContext context) {
  return ListView.builder(
    itemCount: 16,
    itemBuilder: (_, index) {
      return ListTile(
        title: Text("Resident #$index"),
        leading: const Icon(Icons.person),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewResident(index)));
        },
      );
    },
  );
}
*/

class ViewResident extends StatelessWidget {
  final int index;
  ViewResident(this.index, {super.key});

  // ignore: non_constant_identifier_names
  final _textResident_Details = TextEditingController();
  // ignore: non_constant_identifier_names
  final _textMedical_Records = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resident #$index"),
      ),
      body: Center(
        child: ListView(
          children: [
//
            const SizedBox(
              height: 30,
            ),
//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 30,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Resident Details"),
                  hintText: "Resident #$index Details",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textResident_Details.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
//
            const SizedBox(
              height: 15,
            ),
//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 30,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Medical Records"),
                  hintText: "Resident #$index Medical Records",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textMedical_Records.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
//
            const SizedBox(
              height: 30,
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
              child: const Text("Delete Resident"),
              onPressed: () {
                // Delete Resident
              },
            )
          ],
        ),
      ),
    );
  }
}

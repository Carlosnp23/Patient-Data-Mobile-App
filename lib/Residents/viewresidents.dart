import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Residents/editresidents.dart';

// ignore: camel_case_types, must_be_immutable
class View_Resident extends StatelessWidget {
  View_Resident({super.key});

  String getID = '';
  String name = '';

  final CollectionReference _patient =
      FirebaseFirestore.instance.collection('Patient');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Residents"),
      ),
      body: StreamBuilder(
        stream: _patient.snapshots(), // Build connection
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasError) {
            return Text('Something went wrong! ${streamSnapshot.error}');
          } else if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length, // Number of rows
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['address']),
                    onTap: () {
                      getID = documentSnapshot['id']; // Get the ID
                      name = documentSnapshot['name']; // Get Name

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewResident(index, getID, name)));
                    },
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ViewResident extends StatelessWidget {
  final int index;
  final String getID;
  String name;
  ViewResident(this.index, this.getID, this.name, {super.key});

  // ignore: non_constant_identifier_names
  final _textResident_Details = TextEditingController();
  // ignore: non_constant_identifier_names
  final _textMedical_Records = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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
                  hintText: "Details",
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
                  hintText: "Medical Records",
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
                final docPatient =
                    FirebaseFirestore.instance.collection('Patient').doc(getID);

                docPatient.delete();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Edit_Residents()));
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_mobileapp/dashboard.dart';

import '../patientRecordModel.dart';

// ignore: camel_case_types, must_be_immutable
class Medical_Records extends StatelessWidget {
  Medical_Records({super.key});

  String getID = '';
  // ignore: non_constant_identifier_names
  String BP_Record = '';
  // ignore: non_constant_identifier_names
  String BP_Record_Date = '';
  // ignore: non_constant_identifier_names
  String RP_Record = '';
  // ignore: non_constant_identifier_names
  String RP_Record_Date = '';
  // ignore: non_constant_identifier_names
  String BO_Record = '';
  // ignore: non_constant_identifier_names
  String BO_Record_Date = '';
  // ignore: non_constant_identifier_names
  String BPM_Record = '';
  // ignore: non_constant_identifier_names
  String BPM_Record_Date = '';

  final CollectionReference _patient =
      FirebaseFirestore.instance.collection('Patient');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Records List"),
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

                      BP_Record = documentSnapshot['medical_record.BP_Record'];
                      BP_Record_Date =
                          documentSnapshot['medical_record.BP_Record_Date'];
                      RP_Record = documentSnapshot['medical_record.RP_Record'];
                      RP_Record_Date =
                          documentSnapshot['medical_record.RP_Record_Date'];
                      BO_Record = documentSnapshot['medical_record.BO_Record'];
                      BO_Record_Date =
                          documentSnapshot['medical_record.BO_Record_Date'];
                      BPM_Record =
                          documentSnapshot['medical_record.BPM_Record'];
                      BPM_Record_Date =
                          documentSnapshot['medical_record.BPM_Record_Date'];

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicalRecords(
                                    index,
                                    getID,
                                    BP_Record,
                                    BP_Record_Date,
                                    RP_Record,
                                    RP_Record_Date,
                                    BO_Record,
                                    BO_Record_Date,
                                    BPM_Record,
                                    BPM_Record_Date,
                                  )));
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
class MedicalRecords extends StatelessWidget {
  final String getID;
  String name = "";
  // ignore: non_constant_identifier_names
  String BP_Record = '';
  // ignore: non_constant_identifier_names
  String BP_Record_Date = '';
  // ignore: non_constant_identifier_names
  String RP_Record = '';
  // ignore: non_constant_identifier_names
  String RP_Record_Date = '';
  // ignore: non_constant_identifier_names
  String BO_Record = '';
  // ignore: non_constant_identifier_names
  String BO_Record_Date = '';
  // ignore: non_constant_identifier_names
  String BPM_Record = '';
  // ignore: non_constant_identifier_names
  String BPM_Record_Date = '';

  MedicalRecords(
      int index,
      this.getID,
      this.BP_Record,
      this.BP_Record_Date,
      this.RP_Record,
      this.RP_Record_Date,
      this.BO_Record,
      this.BO_Record_Date,
      this.BPM_Record,
      this.BPM_Record_Date,
      {super.key});

  // ignore: non_constant_identifier_names
  final _textBP_Record = TextEditingController();
  // ignore: non_constant_identifier_names
  final _textRP_Record = TextEditingController();
  // ignore: non_constant_identifier_names
  final _textBO_Record = TextEditingController();
  // ignore: non_constant_identifier_names
  final _textBPM_Record = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Records"),
        automaticallyImplyLeading: false,
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
                controller: _textBP_Record,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("BP Record"),
                  hintText: BP_Record,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textBP_Record.clear();
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
                controller: _textRP_Record,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("RP Record"),
                  hintText: RP_Record,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textRP_Record.clear();
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
                controller: _textBO_Record,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("BO Record"),
                  hintText: BO_Record,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textBO_Record.clear();
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
                controller: _textBPM_Record,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("BPM Record"),
                  hintText: BPM_Record,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textBPM_Record.clear();
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
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              icon: const Icon(Icons.update),
              label: const Text("Update"),
              onPressed: () {
                // Update
                DateTime now = DateTime.now();
                String formattedDate =
                    DateFormat('MM/dd/yyyy - hh:mm a').format(now);

                if (_textBP_Record.text == "") {
                  _textBP_Record.text = BP_Record;
                  formattedDate = BP_Record_Date;
                }

                if (_textRP_Record.text == "") {
                  _textRP_Record.text = RP_Record;
                  formattedDate = RP_Record_Date;
                }

                if (_textBO_Record.text == "") {
                  _textBO_Record.text = BO_Record;
                  formattedDate = BO_Record_Date;
                }

                if (_textBPM_Record.text == "") {
                  _textBPM_Record.text = BPM_Record;
                  formattedDate = BPM_Record_Date;
                }

                final docPatient =
                    FirebaseFirestore.instance.collection('Patient').doc(getID);

                // Update BP, RP, BO, BPM Record
                docPatient.update({
                  'medical_record.BP_Record': _textBP_Record.text,
                  'medical_record.BP_Record_Date': formattedDate,
                  'medical_record.RP_Record': _textRP_Record.text,
                  'medical_record.RP_Record_Date': formattedDate,
                  'medical_record.BO_Record': _textBO_Record.text,
                  'medical_record.BO_Record_Date': formattedDate,
                  'medical_record.BPM_Record': _textBPM_Record.text,
                  'medical_record.BPM_Record_Date': formattedDate,
                });

                String formattedDateRecord =
                    DateFormat('MM-dd-yyyy - hh:mm a').format(now);
                String date = formattedDateRecord;
                final bpRecord = _textBP_Record.text;
                final rpRecord = _textRP_Record.text;
                final boRecord = _textBO_Record.text;
                final bpmRecord = _textBPM_Record.text;

                final docPatientRecords = FirebaseFirestore.instance
                    .collection('Patient')
                    .doc(getID)
                    .collection("Records")
                    .doc(date);

                final patientRecords = PatientRecords(
                    id: docPatientRecords.id,
                    BP_Record: bpRecord,
                    RP_Record: rpRecord,
                    BO_Record: boRecord,
                    BPM_Record: bpmRecord); // Patient Records

                final json = patientRecords.toJson();

                // Create document and write data to FireBase
                docPatientRecords.set(json);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Dashboard()));
              },
            ),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              icon: const Icon(Icons.cancel),
              label: const Text("Cancel"),
              onPressed: () {
                // Cancel
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Dashboard()));
              },
            )
          ],
        ),
      ),
    );
  }
}

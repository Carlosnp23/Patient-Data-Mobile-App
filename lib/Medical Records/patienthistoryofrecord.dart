import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class PatientHistoryOfRecord extends StatelessWidget {
  PatientHistoryOfRecord({super.key});

  String getID = '';
  String date = '';

  String bpRecord = '';
  String rpRecord = '';
  String boRecord = '';
  String bpmRecord = '';

  final Future<QuerySnapshot<Map<String, dynamic>>> _patient = FirebaseFirestore
      .instance
      .collection('Patient')
      .doc("kv8zMWECGsnHOSLiHFVo")
      .collection('Records')
      .get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Records History"),
      ),
      body: StreamBuilder(
        stream: _patient.asStream(), // Build connection
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
                    title: Text(documentSnapshot['id']),
                    onTap: () {
                      bpRecord = documentSnapshot['medical_records.BP_Record'];
                      rpRecord = documentSnapshot['medical_records.RP_Record'];
                      boRecord = documentSnapshot['medical_records.BO_Record'];
                      bpmRecord =
                          documentSnapshot['medical_records.BPM_Record'];

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Patient_RecordsHistory(
                                  index,
                                  getID,
                                  date,
                                  bpRecord,
                                  rpRecord,
                                  boRecord,
                                  bpmRecord)));
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

// ignore: must_be_immutable, camel_case_types
class Patient_RecordsHistory extends StatelessWidget {
  final int index;
  final String getID;
  String date;

  String bpRecord;
  String rpRecord;
  String boRecord;
  String bpmRecord;

  Patient_RecordsHistory(this.index, this.getID, this.date, this.bpRecord,
      this.rpRecord, this.boRecord, this.bpmRecord,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(date),
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
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(20.0),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Medical Records',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "BP Record:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      bpRecord,
                      style: const TextStyle(fontSize: 15),
                    ),
//
                    const SizedBox(
                      height: 10,
                    ),
//
                    const Text(
                      "RP Record:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      rpRecord,
                      style: const TextStyle(fontSize: 15),
                    ),
//
                    const SizedBox(
                      height: 10,
                    ),
//
                    const Text(
                      "BO Record:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      boRecord,
                      style: const TextStyle(fontSize: 15),
                    ),
//
                    const SizedBox(
                      height: 10,
                    ),
//
                    const Text(
                      "BPM Record:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      bpmRecord,
                      style: const TextStyle(fontSize: 15),
                    ),
//
                    const SizedBox(
                      height: 10,
                    ),
//
                  ],
                ),
              ),
            ),
//
            const SizedBox(
              height: 30,
            ),
//
          ],
        ),
      ),
    );
  }
}

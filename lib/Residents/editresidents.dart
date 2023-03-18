import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class Edit_Residents extends StatelessWidget {
  Edit_Residents({super.key});

  String getID = '';
  String name = '';
  String age = '';
  String contact = '';
  String address = '';

  final CollectionReference _patient =
      FirebaseFirestore.instance.collection('Patient');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Residents"),
      ),
      //    body: _buildListView(context),

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
                      age = documentSnapshot['age']; // Get Age
                      contact = documentSnapshot[
                          'emergency_contact']; // Get Emergency Contact
                      address = documentSnapshot['address']; // Get Address

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailResident(
                                  index, getID, name, age, contact, address)));
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
class DetailResident extends StatelessWidget {
  final String getID;
  String name;
  String age;
  String contact;
  String address;

  DetailResident(
      int index, this.getID, this.name, this.age, this.contact, this.address,
      {super.key});

  final _textNameDetail = TextEditingController();
  final _textAgeDetail = TextEditingController();
  final _textAddressDetail = TextEditingController();
  final _textEmergencyContactDetail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Resident"),
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
                controller: _textNameDetail,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Name"),
                  hintText: name,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textNameDetail.clear();
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
                controller: _textAgeDetail,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Age"),
                  hintText: age,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textAgeDetail.clear();
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
                controller: _textEmergencyContactDetail,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Emergency Contact"),
                  hintText: contact,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textEmergencyContactDetail.clear();
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
                controller: _textAddressDetail,
                keyboardType: TextInputType.streetAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Address"),
                  hintText: address,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textAddressDetail.clear();
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
              child: const Text("Update"),
              onPressed: () {
                // Update
                final docPatient =
                    FirebaseFirestore.instance.collection('Patient').doc(getID);

                if (_textNameDetail.text == "") {
                  _textNameDetail.text = name;
                }
                if (_textAgeDetail.text == "") {
                  _textAgeDetail.text = age;
                }
                if (_textEmergencyContactDetail.text == "") {
                  _textEmergencyContactDetail.text = contact;
                }
                if (_textAddressDetail.text == "") {
                  _textAddressDetail.text = address;
                }

                docPatient.update({
                  'name': _textNameDetail.text,
                  'age': _textAgeDetail.text,
                  'emergency_contact': _textEmergencyContactDetail.text,
                  'address': _textAddressDetail.text,
                });

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

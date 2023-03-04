// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Add_Heart_beat_BPM_Record extends StatelessWidget {
  Add_Heart_beat_BPM_Record({super.key});

  final _textDateTime = TextEditingController();
  final _textBPMReading = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add BPM Record"),
      ),
      body: Center(
        child: Column(
          children: [
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
              child: const Text("Select Resident"),
              onPressed: () {
                // Select Resident
              },
            ),
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
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Date / Time"),
                  hintText: "Date / Time",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textDateTime.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
//
            const SizedBox(
              height: 25,
            ),
//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("BPM Reading"),
                  hintText: "BPM Reading",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textBPMReading.clear();
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
              child: const Text("Save BPM Record"),
              onPressed: () {
                // SAVE
              },
            )
          ],
        ),
      ),
    );
  }
}

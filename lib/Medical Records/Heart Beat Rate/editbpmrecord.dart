import 'package:flutter/material.dart';

// ignore: camel_case_types
class Edit_BPM_Record extends StatelessWidget {
  const Edit_BPM_Record({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit BPM Record"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
//
              const SizedBox(
                height: 30,
              ),
//
              const Align(
                  alignment: Alignment(-0.8, -0.5),
                  child: Text("Select Resident:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
//
              const SizedBox(
                height: 30,
              ),
//
              Expanded(flex: 2, child: _buildSelectResident(context)),
            ],
          ),
        ));
  }
}

ListView _buildSelectResident(BuildContext context) {
  return ListView.builder(
    itemCount: 16,
    itemBuilder: (_, index) {
      return ListTile(
        title: Text('Resident #$index'),
        leading: const Icon(Icons.person),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailResidentRecord(index)));
        },
      );
    },
  );
}

class DetailResidentRecord extends StatelessWidget {
  final int index;
  const DetailResidentRecord(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit BPM Record"),
      ),
      body: Center(
        child: Column(
          children: [
//
            const SizedBox(
              height: 30,
            ),
//
            const Align(
                alignment: Alignment(-0.8, -0.5),
                child: Text("Select Record:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
//
            const SizedBox(
              height: 30,
            ),
//
            Expanded(flex: 2, child: _buildSelectRecord(context)),
          ],
        ),
      ),
    );
  }
}

ListView _buildSelectRecord(BuildContext context) {
  return ListView.builder(
    itemCount: 16,
    itemBuilder: (_, index) {
      return ListTile(
        title: Text('Record #$index'),
        leading: const Icon(Icons.person),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Resident_Record(index)));
        },
      );
    },
  );
}

// ignore: camel_case_types
class Resident_Record extends StatelessWidget {
  final int index;
  Resident_Record(this.index, {super.key});

  final _textName = TextEditingController();
  final _textMedicalRecordNo = TextEditingController();
  final _textBPMReading = TextEditingController();
  final _textDateTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit BPM Record No. #$index"),
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
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Name"),
                  hintText: "Resident #$index",
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
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Medical Record No."),
                  hintText: "Record #$index",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textMedicalRecordNo.clear();
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
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("BPM Reading"),
                  hintText: "BPM Reading #$index",
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
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Date / Time"),
                  hintText: "Date / Time #$index",
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
              },
            )
          ],
        ),
      ),
    );
  }
}

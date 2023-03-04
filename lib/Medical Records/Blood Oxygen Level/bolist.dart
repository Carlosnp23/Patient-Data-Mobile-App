import 'package:flutter/material.dart';

// ignore: camel_case_types
class BO_List extends StatelessWidget {
  const BO_List({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BO Record List"),
      ),
      body: _buildBPRecordList(context),
    );
  }
}

ListView _buildBPRecordList(BuildContext context) {
  return ListView.builder(
    itemCount: 16,
    itemBuilder: (_, index) {
      return ListTile(
        title: Text('Record #$index'),
        subtitle: Text("Resident #$index"),
        leading: const Icon(Icons.person),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResidentRecord(index)));
        },
      );
    },
  );
}

class ResidentRecord extends StatelessWidget {
  final int index;
  ResidentRecord(this.index, {super.key});

  final _textResidentDetails = TextEditingController();
  final _textBOReadingInfo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Record #$index"),
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
                maxLines: 10,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: const Text("Resident Details"),
                  hintText: "Resident #$index Details",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textResidentDetails.clear();
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
                  label: const Text("BO Reading Info"),
                  hintText: "Record #$index - Date/Time",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textBOReadingInfo.clear();
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

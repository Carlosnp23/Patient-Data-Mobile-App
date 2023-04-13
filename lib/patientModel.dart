// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

class Patient {
  String id;
  final String name;
  final String age;
  // ignore: non_constant_identifier_names
  final String emergency_contact;
  final String address;
  final String doctor;
  // ignore: non_constant_identifier_names
  final String BP_Record;
  // ignore: non_constant_identifier_names
  final String BP_Record_Date;
  // ignore: non_constant_identifier_names
  final String RP_Record;
  // ignore: non_constant_identifier_names
  final String RP_Record_Date;
  // ignore: non_constant_identifier_names
  final String BO_Record;
  // ignore: non_constant_identifier_names
  final String BO_Record_Date;
  // ignore: non_constant_identifier_names
  final String BPM_Record;
  // ignore: non_constant_identifier_names
  final String BPM_Record_Date;

  Patient({
    this.id = '',
    required this.name,
    required this.age,
    // ignore: non_constant_identifier_names
    required this.emergency_contact,
    required this.address,
    required this.doctor,
    // ignore: non_constant_identifier_names
    required this.BP_Record,
    // ignore: non_constant_identifier_names
    required this.BP_Record_Date,
    // ignore: non_constant_identifier_names
    required this.RP_Record,
    // ignore: non_constant_identifier_names
    required this.RP_Record_Date,
    // ignore: non_constant_identifier_names
    required this.BO_Record,
    // ignore: non_constant_identifier_names
    required this.BO_Record_Date,
    // ignore: non_constant_identifier_names
    required this.BPM_Record,
    // ignore: non_constant_identifier_names
    required this.BPM_Record_Date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'emergency_contact': emergency_contact,
        'address': address,
        'doctor': doctor,
        'medical_record': {
          'BP_Record': BP_Record,
          'BP_Record_Date': BP_Record_Date,
          'RP_Record': RP_Record,
          'RP_Record_Date': RP_Record_Date,
          'BO_Record': BO_Record,
          'BO_Record_Date': BO_Record_Date,
          'BPM_Record': BPM_Record,
          'BPM_Record_Date': BPM_Record_Date,
        },
      };

  static Patient fromJson(Map<String, dynamic> json) => Patient(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      emergency_contact: json['emergency_contact'],
      address: json['address'],
      doctor: json['doctor'],
      BP_Record: json['medical_record.BP_Record'],
      BP_Record_Date: json['medical_record.BP_Record_Date'],
      RP_Record: json['medical_record.RP_Record'],
      RP_Record_Date: json['medical_record.RP_Record_Date'],
      BO_Record: json['medical_record.BO_Record'],
      BO_Record_Date: json['medical_record.BO_Record_Date'],
      BPM_Record: json['medical_record.BPM_Record'],
      BPM_Record_Date: json['medical_record.BPM_Record_Date']);
}

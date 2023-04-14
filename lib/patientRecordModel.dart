// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

class PatientRecords {
  String id;
  // ignore: non_constant_identifier_names
  final String BP_Record;
  // ignore: non_constant_identifier_names
  final String RP_Record;
  // ignore: non_constant_identifier_names
  final String BO_Record;
  // ignore: non_constant_identifier_names
  final String BPM_Record;

  PatientRecords({
    this.id = '',
    // ignore: non_constant_identifier_names
    required this.BP_Record,
    // ignore: non_constant_identifier_names
    required this.RP_Record,
    // ignore: non_constant_identifier_names
    required this.BO_Record,
    // ignore: non_constant_identifier_names
    required this.BPM_Record,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'medical_records': {
          'BP_Record': BP_Record,
          'RP_Record': RP_Record,
          'BO_Record': BO_Record,
          'BPM_Record': BPM_Record,
        },
      };

  static PatientRecords fromJson(Map<String, dynamic> json) => PatientRecords(
      id: json['id'],
      BP_Record: json['medical_record.BP_Record'],
      RP_Record: json['medical_record.RP_Record'],
      BO_Record: json['medical_record.BO_Record'],
      BPM_Record: json['medical_record.BPM_Record']);
}

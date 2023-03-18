class Patient {
  String id;
  final String name;
  final int age;
  // ignore: non_constant_identifier_names
  final int emergency_contact;
  final String address;

  Patient({
    this.id = '',
    required this.name,
    required this.age,
    // ignore: non_constant_identifier_names
    required this.emergency_contact,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'emergency_contact': emergency_contact,
        'address': address,
      };

  static Patient fromJson(Map<String, dynamic> json) => Patient(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        emergency_contact: json['emergency_contact'],
        address: json['address'],
      );
}

class EmergencyContact {
  String name;
  String phoneNumber;

  EmergencyContact({required this.name, required this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  factory EmergencyContact.fromJson(Map<String, dynamic> json) {
    return EmergencyContact(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
    );
  }
}

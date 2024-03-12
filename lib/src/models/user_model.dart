import 'package:cloud_firestore/cloud_firestore.dart';

enum Gender { male, female }

Gender parse(String enumString) {
  return Gender.values.firstWhere(
    (e) => e.toString().split('.').last == enumString,
    orElse: () => Gender.male,
  );
}

extension GenderToString on Gender {
  String genderToString() {
    switch (this) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
    }
  }
}

class MyUserModel {
  String firstName, lastName, uid, email, phone, dob;
  Gender gender;
  List<String> searched;
  String? pass;

  MyUserModel(
      {required this.firstName,
      required this.lastName,
      required this.dob,
      required this.email,
      required this.phone,
      required this.gender,
      required this.searched,
      this.pass,
      required this.uid});

  Map<String, dynamic> toJSON() {
    return {
      "First Name": firstName,
      "Last Name": lastName,
      "Email": email,
      "Date of Birth": dob,
      "Gender": gender.toString(),
      "Phone": phone,
      "Searched": searched,
      "uid": uid,
    };
  }

  factory MyUserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return MyUserModel(
        firstName: data['First Name'].toString(),
        lastName: data['Last Name'].toString(),
        email: data['Email'].toString(),
        dob: data['Date of Birth'].toString(),
        phone: data['Phone'].toString(),
        uid: data["uid"].toString(),
        gender: parse(data["Gender"].toString()),
        searched: (data["Searched"]).cast<String>());
  }
}

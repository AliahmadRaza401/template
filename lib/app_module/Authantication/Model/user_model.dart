import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoModel {
  String uid;
  String name;
  String email;
  String phone;
  String dob;
  String password;
  String restId;
  String postalCode;
  String address;
  String image;
  String type;

  UserInfoModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.dob,
    required this.password,
    required this.restId,
    required this.type,
    this.postalCode = '',
    this.address = '',
    this.image = '',
  });

  // Convert a UserInfo object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'dob': dob,
      'password': password,
      'rest_id': restId,
      'postal_code': postalCode,
      'type': type,
      'address': address,
      'image': image,
    };
  }

  // Create a UserInfo object from a Map object
  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      dob: map['dob'],
      type: map['type'],
      password: map['password'],
      restId: map['rest_id'],
      postalCode: map['postal_code'] ?? '',
      address: map['address'] ?? '',
      image: map['image'] ?? '',
    );
  }

  // Create a UserInfo object from a Firestore DocumentSnapshot
  factory UserInfoModel.fromDocument(DocumentSnapshot doc) {
    return UserInfoModel.fromMap(doc.data() as Map<String, dynamic>);
  }
}

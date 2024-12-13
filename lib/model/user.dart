import 'package:flutter/material.dart';

class User {
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.fullname,
    this.registrationStatus,
  });

  final String id;
  String email;
  String password;
  String? fullname;
  RegistrationStatus? registrationStatus;

  bool get isCustomer => email.contains("customer");

  UserType get type {
    if (isCustomer) {
      return UserType.customer;
    } else {
      return UserType.control;
    }
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        fullname: json['fullname'],
        registrationStatus:
            registrationStatusFromFirestore(json['registrationStatus']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'fullname': fullname,
        'registrationStatus': registrationStatusToFirestore(registrationStatus),
      };
}

/// Enum for UserType
enum UserType { customer, control }

/// Enum for RegistrationStatus
enum RegistrationStatus { stopped, running }

/// Convert RegistrationStatus to a string for Firestore
String? registrationStatusToFirestore(RegistrationStatus? status) {
  if (status == null) return null;
  return status.toString().split('.').last;
}

/// Convert a string from Firestore to RegistrationStatus
RegistrationStatus? registrationStatusFromFirestore(String? status) {
  if (status == null) return null;
  return RegistrationStatus.values.firstWhere(
    (e) => e.toString().split('.').last == status,
    orElse: () => RegistrationStatus.stopped, // Default fallback
  );
}

/// Get a descriptive string based on the RegistrationStatus
String getRegistrationStatusDescription(RegistrationStatus status) {
  switch (status) {
    case RegistrationStatus.stopped:
      return "تزويد المياه للمشترك متوقف";
    case RegistrationStatus.running:
      return "جاري تزويد المياه للمشترك";
  }
}

/// Get a color based on the RegistrationStatus
Color getRegistrationStatusColor(RegistrationStatus status) {
  switch (status) {
    case RegistrationStatus.stopped:
      return Colors.red;
    case RegistrationStatus.running:
      return Colors.green;
  }
}

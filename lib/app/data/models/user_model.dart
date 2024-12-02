import 'dart:convert';

class Role {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Role({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final int roleId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool emailVerified;
  final DateTime? dateOfBirth;
  final int? profilePictureId;
  final List<String> contacts;
  final int? companyId;
  final bool deleted;
  final int? createdBy;
  final Role role;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.roleId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.emailVerified,
    this.dateOfBirth,
    this.profilePictureId,
    required this.contacts,
    this.companyId,
    required this.deleted,
    this.createdBy,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      roleId: json['roleId'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      emailVerified: json['emailVerified'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.tryParse(json['dateOfBirth'])
          : null,
      profilePictureId: json['profilePictureId'],
      contacts: List<String>.from(json['contacts']),
      companyId: json['companyId'],
      deleted: json['deleted'],
      createdBy: json['createdBy'],
      role: Role.fromJson(json['role']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'roleId': roleId,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'emailVerified': emailVerified,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'profilePictureId': profilePictureId,
      'contacts': contacts,
      'companyId': companyId,
      'deleted': deleted,
      'createdBy': createdBy,
      'role': role.toJson(),
    };
  }
}

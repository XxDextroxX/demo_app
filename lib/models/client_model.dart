import 'package:demo_app/shared/validator/password.dart';
import 'package:demo_app/shared/validator/validator.dart';

class ClientModel {
  String? id;
  Email email;
  GeneralField name;
  GeneralField lastName;
  GeneralField role;
  Password password;
  bool isActive;

  ClientModel({
    this.id,
    this.email = const Email.pure(),
    this.name = const GeneralField.pure(),
    this.lastName = const GeneralField.pure(),
    this.role = const GeneralField.pure(),
    this.password = const Password.pure(),
    this.isActive = false,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      email: Email.dirty(json['email']),
      name: GeneralField.dirty(json['name']),
      lastName: GeneralField.dirty(json['lastName']),
      role: GeneralField.dirty(json['role']),
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email.value,
      'name': name.value,
      'lastName': lastName.value,
      'role': role.value,
      'password': password.value,
      'isActive': isActive
    };
  }

  ClientModel copyWith({
    Email? email,
    Password? password,
    GeneralField? name,
    GeneralField? lastName,
    GeneralField? role,
    bool? isActive,
  }) {
    return ClientModel(
      email: email ?? this.email,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
      password: password ?? this.password,
      isActive: isActive ?? this.isActive,
    );
  }
}

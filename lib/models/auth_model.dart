import 'package:demo_app/shared/validator/validator.dart';

class AuthModel {
  Email? email;
  Password? password;

  AuthModel({
    this.email,
    this.password,
  });

  //from json
  AuthModel.fromJson(Map<String, dynamic> json) {
    email = json['email'] != null
        ? Email.dirty(json['email'])
        : const Email.dirty('');
    password = json['password'] != null
        ? Password.dirty(json['password'])
        : const Password.dirty('');
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email?.value,
      'password': password?.value,
    };
  }

  //copy with

  AuthModel copyWith({
    Email? email,
    Password? password,
  }) {
    return AuthModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

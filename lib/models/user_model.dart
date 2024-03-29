class UserModel {
  static UserModel? _instance;

  String? uid;
  String? email;
  String? name;
  String? lastName;
  String? role;
  bool? isActive;

  UserModel._({
    this.uid,
    this.email,
    this.name,
    this.lastName,
    this.role,
    this.isActive,
  });

  factory UserModel.instance() {
    _instance ??= UserModel._();
    return _instance!;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel._(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      lastName: json['lastName'],
      role: json['role'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'lastName': lastName,
      'role': role,
      'isActive': isActive
    };
  }

  //set data user

  void setData(UserModel data) {
    uid = data.uid;
    email = data.email;
    name = data.name;
    lastName = data.lastName;
    role = data.role;
    isActive = data.isActive;
  }

  UserModel getData() {
    return UserModel._(
      uid: uid,
      email: email,
      name: name,
      lastName: lastName,
      role: role,
      isActive: isActive,
    );
  }

  //reset data

  void resetData() {
    uid = null;
    email = null;
    name = null;
    lastName = null;
    role = null;
    isActive = null;
  }
}

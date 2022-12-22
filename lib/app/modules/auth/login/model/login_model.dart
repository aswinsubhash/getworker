class LoginModel {
  String? id;
  String? name;
  String? email;
  String? userType;
  String? employeeData;
  bool? isBlocked;
  String? token;
  LoginModel({
    this.id,
    this.name,
    this.email,
    this.userType,
    this.employeeData,
    this.isBlocked,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
        id: json["_id"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        userType: json["userType"] ?? '',
        employeeData: json["employeeData"] ?? '',
        isBlocked: json["isBlocked"],
        token: json["token"] ?? '',
      );
}

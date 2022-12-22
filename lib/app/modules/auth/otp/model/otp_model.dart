class OTPModel {
  OTPModel({
    this.id,
    this.name,
    this.email,
    this.userType,
    this.employeeData,
    this.emailVerified,
    this.token,
  });
  String? id;
  String? name;
  String? email;
  String? userType;
  String? employeeData;
  bool? emailVerified;
  String? token;

  factory OTPModel.fromJson(Map<String, dynamic> json) =>
      OTPModel(
        id: json["_id"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        userType: json["userType"] ?? '',
        employeeData: json["employeeData"] ?? '',
        emailVerified: json["emailVerified"],
        token: json["token"] ?? '',
      );
}

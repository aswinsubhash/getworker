class SignupModel {
  SignupModel({
    this.name,
    this.email,
    this.password,
    this.userType,
    this.emailVerified,
    this.isBlocked,
    this.reported,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? name;
  String? email;
  String? password;
  String? userType;
  bool? emailVerified;
  bool? isBlocked;
  int? reported;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory SignupModel.fromJson(Map<String, dynamic> json) =>
      SignupModel(
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        password: json["password"] ?? '',
        userType: json["userType"] ?? '',
        emailVerified: json["emailVerified"],
        isBlocked: json["isBlocked"],
        reported: json["reported"] ?? '',
        id: json["_id"] ?? '',
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"] ?? '',
      );


}

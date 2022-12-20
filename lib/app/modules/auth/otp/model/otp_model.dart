
import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
    OtpModel({
        required this.userId,
        required this.otp,
        required this.userType,
    });

    String userId;
    String otp;
    String userType;

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        userId: json["userId"],
        otp: json["otp"],
        userType: json["userType"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "otp": otp,
        "userType": userType,
    };
}

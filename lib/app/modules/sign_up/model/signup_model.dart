import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
        required this.name,
        required this.email,
        required this.password,
        required this.userType,
    });

    String name;
    String email;
    String password;
    String userType;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        userType: json["userType"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "userType": userType,
    };
}





//'http://10.0.2.2:3001/api/register'

// {
//       "name": "aswin",
//       "email": "aswins@gmail.com",
//       "password": "aswinaswin",
//       "userType": "employee"
//     }


// "email":"aswinsubhash3@gmail.com",
//   "password":"aswinaswin"

// http.Response response = await http.post(
//     Uri.parse('http://10.0.2.2:3001/api/login'),
//     body: {
//   "email":"aswinsubhash3@gmail.com",
//   "password":"aswinaswin"
// },
//   );
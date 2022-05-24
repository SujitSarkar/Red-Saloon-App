// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));


class LoginModel {
  LoginModel({
    this.success,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  bool? success;
  String? accessToken;
  String? tokenType;
  int? expiresIn;


  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}

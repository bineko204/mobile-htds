// To parse this JSON data, do
//
//     final authenticateUserGosignModel = authenticateUserGosignModelFromJson(jsonString);

import 'dart:convert';

class AuthenticateUserGoSignModel {
  String? authType;
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  List<OtpInfo>? otpInfo;

  AuthenticateUserGoSignModel({
    this.authType,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.otpInfo,
  });

  AuthenticateUserGoSignModel copyWith({
    String? authType,
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    List<OtpInfo>? otpInfo,
  }) =>
      AuthenticateUserGoSignModel(
        authType: authType ?? this.authType,
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        otpInfo: otpInfo ?? this.otpInfo,
      );

  factory AuthenticateUserGoSignModel.fromRawJson(String str) => AuthenticateUserGoSignModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthenticateUserGoSignModel.fromJson(Map<String, dynamic> json) => AuthenticateUserGoSignModel(
    authType: json["auth_type"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    otpInfo: json["otp_info"] == null ? [] : List<OtpInfo>.from(json["otp_info"]!.map((x) => OtpInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "auth_type": authType,
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "otp_info": otpInfo == null ? [] : List<dynamic>.from(otpInfo!.map((x) => x.toJson())),
  };
}

class OtpInfo {
  String? otpType;
  String? sentTo;

  OtpInfo({
    this.otpType,
    this.sentTo,
  });

  OtpInfo copyWith({
    String? otpType,
    String? sentTo,
  }) =>
      OtpInfo(
        otpType: otpType ?? this.otpType,
        sentTo: sentTo ?? this.sentTo,
      );

  factory OtpInfo.fromRawJson(String str) => OtpInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpInfo.fromJson(Map<String, dynamic> json) => OtpInfo(
    otpType: json["otp_type"],
    sentTo: json["sent_to"],
  );

  Map<String, dynamic> toJson() => {
    "otp_type": otpType,
    "sent_to": sentTo,
  };
}

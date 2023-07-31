class AuthenticateGosignModel {
  AuthenticateGosignModel({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn,});

  AuthenticateGosignModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
  String? accessToken;
  String? tokenType;
  num? expiresIn;
AuthenticateGosignModel copyWith({  String? accessToken,
  String? tokenType,
  num? expiresIn,
}) => AuthenticateGosignModel(  accessToken: accessToken ?? this.accessToken,
  tokenType: tokenType ?? this.tokenType,
  expiresIn: expiresIn ?? this.expiresIn,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    return map;
  }

}
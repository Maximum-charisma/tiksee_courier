import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    required this.token,
    required this.secretRoute,
  });

  String token;
  String secretRoute;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        token: json["token"],
        secretRoute: json["secret_route"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "secret_route": secretRoute,
      };
}

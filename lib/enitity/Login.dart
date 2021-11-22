class Login {
  String token;

  Login({this.token = ""});

  factory Login.fromJson(Map<String, dynamic> json) =>
      Login(token: json['token']);

  Map<String, dynamic> toJson() => {"token": token};
}

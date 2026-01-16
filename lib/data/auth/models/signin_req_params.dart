class SigninReqParams {
  final String email;
  final String password;

  SigninReqParams({required this.email, required this.password});

  factory SigninReqParams.fromJson(Map<String, dynamic> json) {
    return SigninReqParams(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}

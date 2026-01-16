class SignupReqParams {
  final String email;
  final String password;

  SignupReqParams({required this.email, required this.password});

  factory SignupReqParams.fromJson(Map<String, dynamic> json) {
    return SignupReqParams(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}

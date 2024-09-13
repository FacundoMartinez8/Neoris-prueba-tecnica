class Credenciales {
  final String email;
  final String password;

  Credenciales({required this.email, required this.password});

  factory Credenciales.fromJson(Map<String, dynamic> json) {
    return Credenciales(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

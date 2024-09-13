import 'dart:convert';
import 'package:tecnica_neoris/core/models/credentials_model.dart';
import 'package:tecnica_neoris/core/models/user_model.dart';

class DataSourceLogin {
  String jsonUsers = '''
 [
    {"name": "Juan Pérez", "email": "juan.perez@example.com", "password": "123456"},
    {"name": "María González", "email": "maria.gonzalez@example.com", "password": "password"},
    {"name": "Carlos Fernández", "email": "carlos.fernandez@example.com", "password": "mypassword"},
    {"name": "Fernando García", "email": "fernando.garcia@example.com", "password": "pass123"},
    {"name": "Laura Díaz", "email": "laura.diaz@example.com", "password": "password123"}
]
  ''';

  Future<bool> login(Credenciales credenciales) async {
    try {
      await Future.delayed(Duration(seconds: 3));

      final List<dynamic> data = jsonDecode(jsonUsers);

      final user = data.firstWhere(
        (user) => user['email'] == credenciales.email && user['password'] == credenciales.password,
        orElse: () => null,
      );

      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error durante el login: $e');
      rethrow;
    }
  }

  Future<User> getUser(String email) async {
    try {
      final List<dynamic> data = jsonDecode(jsonUsers);

      final userJson = data.firstWhere((user) => user['email'] == email);

      return User.fromJson(userJson);
    } catch (e) {
      print('Error al obtener el usuario: $e');
      rethrow;
    }
  }
}

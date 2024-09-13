import 'package:http/http.dart';
import 'package:tecnica_neoris/core/models/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataSourceList {
  String jsonString = '''
 [
    {"name": "Juan Pérez", "email": "juan.perez@example.com"},
    {"name": "María González", "email": "maria.gonzalez@example.com"},
    {"name": "Carlos Fernández", "email": "carlos.fernandez@example.com"},
    {"name": "Fernando García", "email": "fernando.garcia@example.com"},
    {"name": "Laura Díaz", "email": "laura.diaz@example.com"},
    {"name": "Santiago Romero", "email": "santiago.romero@example.com"},
    {"name": "Sofía Torres", "email": "sofia.torres@example.com"}
]
  ''';

  Future<List<User>> getUser() async {
    try {
      final url = Uri.parse('/users/');

      //final response = await http.get(url);

      final List<dynamic> data = jsonDecode(jsonString);

      return data.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      print('Excepción al realizar la solicitud: $e');
      rethrow;
    }
  }
}

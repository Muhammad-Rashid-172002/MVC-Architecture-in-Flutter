import 'dart:convert';

import 'package:http/http.dart' as http;

class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], email: json['email']);
  }
  static Future<UserModel> fetchUserData() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }
  }
}

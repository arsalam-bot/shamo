// Request ke backend

import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://127.0.0.1:8000/api';

  Future<UserModel> register({
    required String name,
    required String email,
    required String username,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel dataUser = UserModel.fromJson(data['user']);
      dataUser.token = 'Bearer ' + data['access_token'];

      return dataUser;
    } else {
      throw Exception('Gagal Register');
    }
  }
}

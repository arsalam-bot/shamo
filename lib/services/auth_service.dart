// Request ke backend

import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://192.168.1.13:8000/api';
  // final String baseUrl = 'http://10.0.2.2:8000/api';

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
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel dataUser = UserModel.fromJson(data['user']);
      dataUser.token = 'Bearer ' + data['access_token'];
      // dataUser.token = 'Bearer ${data['access_token']}';

      return dataUser;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel dataUser = UserModel.fromJson(data['user']);
      dataUser.token = 'Bearer ' + data['access_token'];
      // dataUser.token = 'Bearer ${data['access_token']}';

      return dataUser;
    } else {
      throw Exception('Gagal Login');
    }
  }
}

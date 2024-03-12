import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthServices {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('https://fakestoreapi.com/auth/login');

    final authData = {
      'username': email,
      'password': password,
    };

    final response = await http.post(url, body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(response.body);

    if (decodedResp.containsKey('token')) {
      return {'ok': true, 'token': decodedResp['token']};
    }else{
      return {'ok': false, 'message': decodedResp['error']['message']};
      
    }
  }
}

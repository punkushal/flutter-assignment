import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppDataProvider with ChangeNotifier {
  Future<void> registerUser(String username, String password) async {
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
    final String body = jsonEncode(data);
    final uri = Uri.parse("https://interview-mock-api.onrender.com/signup");

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
    try {
      if (response.statusCode == 200) {
        print('Successfully register the user');
      } else {
        print('failed to register the user');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  loginUser(String username, String password) async {
    final uri = Uri.parse("https://interview-mock-api.onrender.com/login");
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
    final String body = jsonEncode(data);
    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
    try {
      if (response.statusCode == 200) {
        print('Successfully logged in the user');
      } else {
        print('failed to logged in the user');
      }
    } catch (error) {
      print(error.toString());
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String? message;
  String? token;

  final _url = 'https://identitytoolkit.googleapis.com/v1/';
  final _resource = 'accounts:'; // signUp // signInWithPassword
  final _apiKey = '?key=AIzaSyDgnQPocepB41aR1pkb8V6ien-76zDZ3d0';

  Future<bool> authRequest(String email, String password, String action) async {
    String sUri = '$_url$_resource$action$_apiKey';
    Uri uri = Uri.parse(sUri);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
      'returnSecureToken': 'true'
    });
    var resp = jsonDecode(response.body);
    if (response.statusCode == 200) {
      message = "Usuário cadastrado com sucesso!";
      token = resp["idToken"];
      return true;
    } else {
      message = "Erro ao cadastrar Usuário!";
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    return authRequest(email, password, 'signUp');
  }

  Future<bool> signIn(String email, String password) async {
    return authRequest(email, password, 'signInWithPassword');
  }
}
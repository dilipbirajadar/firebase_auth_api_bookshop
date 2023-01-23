import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;


class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;

  bool get isAuth {
    if (token != null) {
      print('isAuth is true');
      return true;
    } else {
      print('isAuth is false');
      return false;
    }

    // return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return 'null';
  }

  Future<void> _autheticate(
      String emailId, String password, String urlSegment) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDlpdLJbXIrkpZIYpowapPMjHLLFkwcjFI");
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': emailId,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String emailId, String password) async {
    return _autheticate(emailId, password, 'signUp');
  }

  Future<void> signin(String emailId, String password) async {
    return _autheticate(emailId, password, 'signInWithPassword');
  }
}
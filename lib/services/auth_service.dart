import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  final String _urlBase = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = '';

  /// Sends a request to Firebase to create a new user using email and password
  Future<String?> signUp(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        Uri.https(_urlBase, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // TODO: SAVE TOKEN
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  /// Sends a request to Firebase to login using email and password
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(
        _urlBase, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // TODO: SAVE TOKEN
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }
}

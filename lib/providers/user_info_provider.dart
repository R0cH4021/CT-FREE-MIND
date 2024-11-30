import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void login(String id, String name) {
    _user = User(id: id, name: name);
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}

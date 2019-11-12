import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  var isAuthenticated = false;

  LoginProvider(@required this.isAuthenticated);

  changeAuthenticated(var isAuthenticated) {
    this.isAuthenticated = isAuthenticated;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  String name = "Martín";
  String role = "Full Stack Developer";

  void updateProfile(String newName, String newRole) {
    name = newName;
    role = newRole;
    notifyListeners();
  }
}

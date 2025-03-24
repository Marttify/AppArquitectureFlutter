import 'package:flutter/material.dart';

class ChatsViewModel extends ChangeNotifier {
  List<String> messages = [];

  void sendMessage(String message) {
    messages.add(message);
    notifyListeners();
  }
}

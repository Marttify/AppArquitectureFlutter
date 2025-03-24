import 'package:flutter/material.dart';

class ExperienceViewModel extends ChangeNotifier {
  List<String> experiences = ["Flutter Developer", "Backend Developer"];

  void addExperience(String experience) {
    experiences.add(experience);
    notifyListeners();
  }
}

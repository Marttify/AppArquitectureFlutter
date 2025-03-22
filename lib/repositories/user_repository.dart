import '../models/user_model.dart';

class UserRepository {
  Future<UserModel> fetchUser() async {
    await Future.delayed(Duration(seconds: 2)); // Simula una API
    return UserModel(name: "Martín Aguilar", age: 26);
  }
}

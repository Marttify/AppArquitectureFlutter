import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MVVM en Flutter")),
      body: Consumer<UserViewModel>(
        builder: (context, userViewModel, child) {
          if (userViewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Center(
            child: userViewModel.user == null
                ? ElevatedButton(
                    onPressed: () => userViewModel.loadUser(),
                    child: Text("Cargar Usuario"),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Nombre: ${userViewModel.user!.name}"),
                      Text("Edad: ${userViewModel.user!.age}"),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

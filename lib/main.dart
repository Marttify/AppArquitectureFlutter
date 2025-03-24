import 'package:app_arquitecture/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/home_viewmodel.dart';
import 'views/home/home_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Arquitectura',
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}

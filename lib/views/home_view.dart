// ignore_for_file: depend_on_referenced_packages

import 'package:app_arquitecture/core/navBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_viewmodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Fondo oscuro para mejor contraste
      appBar: AppBar(
        title: const Text("MVVM en Flutter"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SafeArea(
        child: Consumer<UserViewModel>(
          builder: (context, userViewModel, child) {
            if (userViewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: userViewModel.user == null
                  ? ElevatedButton(
                      onPressed: userViewModel.loadUser,
                      child: const Text("Ver postulante"),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage("assets/profile.png"),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Martín - Full Stack Developer",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Apasionado por el desarrollo web y móvil. Trabajo con tecnologías modernas para crear soluciones eficientes y escalables.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Tecnologías principales",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 12,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: const [
                              TechChip(
                                  icon: FontAwesomeIcons.html5, label: "HTML"),
                              TechChip(
                                  icon: FontAwesomeIcons.css3, label: "CSS"),
                              TechChip(
                                  icon: FontAwesomeIcons.js,
                                  label: "JavaScript"),
                              TechChip(
                                  icon: FontAwesomeIcons.react, label: "React"),
                              TechChip(
                                  icon: FontAwesomeIcons.node,
                                  label: "Node.js"),
                              TechChip(
                                  icon: FontAwesomeIcons.swift, label: "Swift"),
                              TechChip(
                                  icon: FontAwesomeIcons.flutter,
                                  label: "Flutter"),
                              TechChip(
                                  icon: FontAwesomeIcons.database,
                                  label: "SQL"),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialButton(
                                  icon: FontAwesomeIcons.github,
                                  url: "https://github.com/Marttify"),
                              const SizedBox(width: 15),
                              SocialButton(
                                  icon: FontAwesomeIcons.linkedin,
                                  url:
                                      "https://www.linkedin.com/in/jes%C3%BAs-martin-aguilar/"),
                              const SizedBox(width: 15),
                              SocialButton(
                                  icon: FontAwesomeIcons.envelope,
                                  url: "mailto:aguilarmartin@gmail.com"),
                            ],
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
      bottomNavigationBar: NavBar(
            selectedIndex: _selectedIndex, // Pasar el índice seleccionado
            onItemTapped: _onItemTapped, // Pasar la función de actualización
      ),
    );
  }
}

class TechChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const TechChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.blueGrey[700],
      label: Text(label, style: const TextStyle(color: Colors.white)),
      avatar: Icon(icon, size: 18, color: Colors.white),
    );
  }
}


class SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const SocialButton({super.key, required this.icon, required this.url});

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir el enlace: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blueGrey[800],
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}

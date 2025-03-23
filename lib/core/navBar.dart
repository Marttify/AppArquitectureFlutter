// ignore_for_file: file_names


import 'package:app_arquitecture/views/home_view.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int selectedIndex; // Recibir el índice seleccionado
  final Function(int) onItemTapped; // Recibir la función de actualización

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<NavBar> createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blueGrey[800],
      child: SizedBox(
        height: 90.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildIconWithText(Icons.home, "Home", 0, context),
            _buildIconWithText(Icons.chat_bubble_outline, "Chats", 1, context),
            _buildIconWithText(Icons.tour, "Experiencia", 2, context),
            _buildIconWithText(Icons.person_outline, "Perfil", 3, context),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithText(
      IconData icon, String label, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onItemTapped(index); // Actualizar el índice seleccionado
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: widget.selectedIndex == index
                ? const Color.fromARGB(255, 51, 246, 175)
                : const Color.fromRGBO(155, 149, 149, 1),
            size: 30,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: widget.selectedIndex == index
                  ? const Color.fromARGB(255, 51, 246, 175)
                  : const Color.fromRGBO(155, 149, 149, 1),
            ),
          ),
        ],
      ),
    );
  }
}

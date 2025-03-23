import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("¡Mi experiencia!"),
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ExperienceCard(
              company: "WeSpeak",
              role: "Ingeniero de software",
              location: "En remoto",
              period: "NOV DE 2023 - AGO DE 2024",
              responsibilities: [
                "Diseñar y desarrollar soluciones de software para mejorar la calidad del sistema.",
                "Incorporé y mejoré los routing fundamentales.",
                "Creé interfaces para cubrir necesidades en admin/client.",
                "Manejé API propias y externas.",
                "Enfrenté y solucioné bugs."
              ],
            ),
            const SizedBox(height: 20),
            ExperienceCard(
              company: "SalesUp :: eCommerce & Marketplaces",
              role: "Desarrollador",
              location: "Argentina - En remoto",
              period: "SEPT. 2022 - DIC. 2023 · 4 meses",
              responsibilities: [
                "Especializado en la gestión, desarrollo y diseño de MercadoShop.",
                "Trabajé con el lenguaje de handlebars.js mejorando sus diseños.",
                "Automatización de la aplicación de diseños estándares desde la app."
              ],
            ),
            const SizedBox(height: 20),
            ExperienceCard(
              company: "Bysbit",
              role: "Desarrollador full stack (freelance)",
              location: "En remoto",
              period: "DIC. 2021 - SEP. 2022",
              responsibilities: [
                "Fui el CEO junto a un colega.",
                "Diseñé y desarrollé páginas web para pequeños y medianos emprendimientos según sus requerimientos."
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String company;
  final String role;
  final String location;
  final String period;
  final List<String> responsibilities;

  const ExperienceCard({
    super.key,
    required this.company,
    required this.role,
    required this.location,
    required this.period,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[700],
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "$role - $location",
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              period,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Responsabilidades:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            ...responsibilities.map((responsibility) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  "• $responsibility",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

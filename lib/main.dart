import 'package:flutter/material.dart';
import 'widgets/app_theme.dart';
import 'widgets/navbar.dart';
import 'widgets/footer.dart';
import 'features/home/home_section.dart';
import 'features/about/about_section.dart';
import 'features/projects/projects_section.dart';
import 'features/blog/blog_section.dart';
import 'features/contact/contact_section.dart';
import 'features/home/features_section.dart';
import 'features/space_hub/space_hub_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeddyNova',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeSection(),
            FeaturesSection(),
            AboutSection(),
            ProjectsSection(),
            BlogSection(),
            SpaceHubSection(),
            ContactSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

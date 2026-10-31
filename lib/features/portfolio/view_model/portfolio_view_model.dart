import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nada_portfolio/features/portfolio/data/project_data.dart';

enum ContactSubmissionResult { success, failed, networkError }

class PortfolioViewModel extends ChangeNotifier {
  String _selectedFilter = 'All';

  String get selectedFilter => _selectedFilter;

  static const List<ProjectData> projects = [
    ProjectData(
      'Movin',
      'A Flutter real estate app for browsing, buying, and selling properties. Built with REST APIs, state management, and Clean Architecture.',
      'Flutter · Dart · REST API · Clean Architecture · State Management',
      Icons.apartment_rounded,
      Color(0xFF3C9BFF),
      'Real estate mobile app · Team graduation project',
      groups: ['Team Projects', 'API-based'],
      githubUrl: 'https://github.com/nourayman242/Movin',
      imageAsset: 'assets/images/movin app.jpeg',
    ),
    ProjectData(
      'To The Bone',
      'A customer ordering app and restaurant admin dashboard in one system. Customers can browse, order, track, save favorites, and reorder.',
      'Flutter · Firebase · Firestore · FCM · Auth · Storage',
      Icons.restaurant_rounded,
      Color(0xFFFF647C),
      'Restaurant ordering system · DEPI',
      groups: ['Team Projects', 'Firebase'],
      githubUrl: 'https://github.com/mariamdokmakk/Food-Delivery-App',
      imageAsset: 'assets/images/food-deliver app.jpeg',
    ),
    ProjectData(
      'Notes',
      'Capture and organize ideas as searchable notes, notebooks, and to-do lists.',
      'Flutter · Dart · Local Storage',
      Icons.sticky_note_2_rounded,
      Color(0xFFFFB44D),
      'Productivity app · Udemy',
      groups: ['Firebase'],
      githubUrl:
          'https://github.com/NadaSaber2112/Flutter-Projects/tree/main/notes',
      imageAsset: 'assets/images/note app.jpeg',
    ),
    ProjectData(
      'Weather',
      'Search any city to view minimum and maximum temperatures and current weather details.',
      'Flutter · REST API · JSON',
      Icons.cloud_rounded,
      Color(0xFF3AD7CF),
      'Weather search · Udemy',
      groups: ['API-based'],
      githubUrl: 'https://github.com/NadaSaber2112/Flutter-Projects/tree/main/weather_app',
      imageAsset: 'assets/images/wheather app.jpeg',
    ),
    ProjectData(
      'News',
      'Browse world news across sports, entertainment, business, science, health, and technology.',
      'Flutter · REST API · Dart',
      Icons.newspaper_rounded,
      Color(0xFF7C5CFF),
      'News reader · Udemy',
      groups: ['API-based'],
      githubUrl:
          'https://github.com/NadaSaber2112/Flutter-Projects/tree/main/news',
      imageAsset: 'assets/images/news app.jpeg',
    ),
    // ProjectData(
    //   'Toku',
    //   'A friendly mobile app that teaches the foundations of the Japanese language.',
    //   'Flutter · Dart · Audio',
    //   Icons.translate_rounded,
    //   Color(0xFF45D6A5),
    //   'Language learning · Udemy',
    //   groups: ['Firebase'],
    //   githubUrl:
    //       'https://github.com/NadaSaber2112/Flutter-Projects/tree/main/toku2',
    //   imageAsset: 'assets/projects/toku.png',
    // ),
  ];

  List<ProjectData> get filteredProjects => projects
      .where(
        (project) =>
            _selectedFilter == 'All' ||
            project.groups.contains(_selectedFilter),
      )
      .toList();

  Future<ContactSubmissionResult> sendContactMessage({
    required String name,
    required String email,
    required String projectType,
    required String message,
  }) async {
    // EmailJS request is kept in the ViewModel so the View only handles UI feedback.
    // Credentials and request shape are preserved from the original portfolio.
    const serviceId = 'service_gndbmoz';
    const templateId = 'template_v5cs5ks';
    const publicKey = 'qRPk0A6ot360tG5eE';

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': publicKey,
          'template_params': {
            'name': name.trim(),
            'email': email.trim(),
            'project_type': projectType,
            'message': message.trim(),
            'to_email': 'nadasaber6688@gmail.com',
          },
        }),
      );
      return response.statusCode == 200
          ? ContactSubmissionResult.success
          : ContactSubmissionResult.failed;
    } catch (_) {
      return ContactSubmissionResult.networkError;
    }
  }

  void selectFilter(String filter) {
    if (_selectedFilter == filter) return;
    _selectedFilter = filter;
    notifyListeners();
  }
}

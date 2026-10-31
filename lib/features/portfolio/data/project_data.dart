import 'package:flutter/material.dart';

class ProjectData {
  final String title, description, tech, category, githubUrl, imageAsset;
  final IconData icon;
  final Color color;
  final List<String> groups;
  const ProjectData(
    this.title,
    this.description,
    this.tech,
    this.icon,
    this.color,
    this.category, {
    this.groups = const [],
    required this.githubUrl,
    required this.imageAsset,
  });
}

import 'package:flutter/material.dart';

enum TaskStatus { inProgress, completed, pending }

class Task {
  const Task({
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.progress,
    required this.color,
    required this.icon,
  });

  final String title;
  final String description;
  final String category;
  final TaskStatus status;
  final double progress;
  final Color color;
  final IconData icon;
}

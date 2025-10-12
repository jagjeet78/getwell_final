import 'package:flutter/material.dart';

// Model for medical category
class MedicalCategory {
  final IconData icon;
  final String name;

  MedicalCategory({required this.icon, required this.name});
}

// Sample data list
final List<MedicalCategory> medicalCategories = [
  MedicalCategory(icon: Icons.face, name: 'Dermatology'),
  MedicalCategory(icon: Icons.favorite, name: 'Cardiology'),
  MedicalCategory(icon: Icons.healing, name: 'Gen Surgery'),
  MedicalCategory(icon: Icons.local_hospital, name: 'Medicine'),
  MedicalCategory(icon: Icons.child_care, name: 'Pediatrics'),
  MedicalCategory(icon: Icons.psychology, name: 'Psychiatry'),
 
  MedicalCategory(icon: Icons.accessibility, name: 'Orthopedics'),
  MedicalCategory(icon: Icons.pregnant_woman, name: 'Gynecology'),
  MedicalCategory(icon: Icons.sick, name: 'Neurology'),
];

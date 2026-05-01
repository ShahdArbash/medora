import 'package:flutter/material.dart';

class CategoryIconMapper {
  static String mapBackendIcon(String? icon) {
    switch (icon) {
      case 'fa-solid fa-droplet':
        return 'blood';

      case 'fa-solid fa-flask-vial':
        return 'chemistry';

      case 'fa-solid fa-dna':
        return 'dna';

      case 'fa-solid fa-microscope':
        return 'microscope';

      case 'fa-solid fa-virus':
        return 'virus';

      case 'fa-solid fa-vial':
        return 'urine';

      case 'fa-solid fa-vial-circle-check':
        return 'stool';

      case 'fa-solid fa-shield-virus':
        return 'immunity';

      case 'fa-solid fa-fingerprint':
        return 'genetic';

      case 'fa-solid fa-gem':
        return 'minerals';

      case 'fa-solid fa-heart-pulse':
        return 'heart';

      case 'fa-solid fa-baby':
        return 'pregnancy';

      case 'fa-solid fa-hand-dots':
        return 'allergy';

      default:
        return 'default';
    }
  }

  static IconData mapToIcon(String name) {
    switch (name) {
      case 'blood':
        return Icons.bloodtype;

      case 'chemistry':
        return Icons.science;

      case 'dna':
        return Icons.biotech;

      case 'microscope':
        return Icons.science;

      case 'virus':
        return Icons.coronavirus;

      case 'urine':
        return Icons.water_drop;

      case 'stool':
        return Icons.medical_services;

      case 'immunity':
        return Icons.shield;

      case 'genetic':
        return Icons.biotech;

      case 'minerals':
        return Icons.diamond;

      case 'heart':
        return Icons.favorite;

      case 'pregnancy':
        return Icons.child_care;

      case 'allergy':
        return Icons.healing;

      default:
        return Icons.science;
    }
  }
}

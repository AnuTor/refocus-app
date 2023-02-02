import 'package:flutter/foundation.dart';
import './activity.dart';

class Path with ChangeNotifier {
  final int id;
  final int days;
  final DateTime startdate;
  final String title;
  final String subtitle;
  final String image;
  final List<Activity> activities;

  Path({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.days,
    required this.startdate,
    required this.activities
  });
}

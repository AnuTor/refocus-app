import 'package:flutter/foundation.dart';

class Activity with ChangeNotifier {
  final int id;
  final String title;
  final String? subtitle;
  final String image;
  final String text;
  final bool audio;
  final String? audiofile;
  bool done;
  bool reversed;

  Activity(
      {required this.id,
      required this.title,
      this.subtitle,
      required this.image,
      required this.text,
      this.audio = false,
      this.audiofile,
      this.done = false,
      this.reversed = false});

  void setDone() {
    done = true;
  }

  void clearDoneState() {
    done = false;
  }
}

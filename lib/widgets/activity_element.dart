import 'package:flutter/material.dart';

import '../providers/activity.dart';
import '../screens/activity_screen.dart';

class ActivityElement extends StatelessWidget {
  final String path;
  final Activity activity;
  final bool enable;

  const ActivityElement({
    Key? key,
    required this.path,
    required this.activity,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      shape: const CircleBorder(),
    );

    return ElevatedButton(
      onPressed: enable
          ? () => {
                Navigator.of(context).pushNamed(
                  ActivityScreen.routeName,
                  arguments: {'path': path, 'activity': activity},
                )
              }
          : null,
      style: style,
      child: enable ? Text(activity.id.toString()) : const Icon(Icons.lock),
    );
  }
}

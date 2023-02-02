import 'package:flutter/material.dart';

import '../providers/activity.dart';
import '../screens/activity_screen.dart';

class ActivityElement extends StatelessWidget {
  final String path;
  final Activity activity;
  final Widget content;
  final bool enable;

  const ActivityElement({
    Key? key,
    required this.path,
    required this.activity,
    required this.content,
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
                  arguments: {
                    'path': path,
                    'activity': activity
                  },
                )
              }
          : null,
      style: style,
      child: content,
    );
  }
}

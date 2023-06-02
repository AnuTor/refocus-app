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
      textStyle: const TextStyle(fontSize: 22),
      shape: const CircleBorder(),
      fixedSize: Size(64, 64),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
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
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(activity.title),
            activity.audio ? const Text('Audio') : const Text('Texto')
          ],
        )
      ],
    );
  }
}

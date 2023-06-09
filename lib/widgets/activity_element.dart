import 'package:flutter/material.dart';

import '../providers/activity.dart';
import '../screens/activity_screen.dart';

class ActivityElement extends StatefulWidget {
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
  State<ActivityElement> createState() => _ActivityElementState();
}

class _ActivityElementState extends State<ActivityElement> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 22),
        shape: const CircleBorder(),
        //fixedSize: Size(60, 60),
        padding: EdgeInsets.all(15));

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: ElevatedButton(
            onPressed: widget.enable
                ? () => {
                      Navigator.of(context).pushNamed(
                        ActivityScreen.routeName,
                        arguments: {
                          'path': widget.path,
                          'activity': widget.activity
                        },
                      )
                    }
                : null,
            style: style,
            child: widget.enable
                ? Text(widget.activity.id.toString())
                : const Icon(Icons.lock),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.activity.title,
                overflow: TextOverflow.fade,
                softWrap: false,
                maxLines: 1,
              ),
              widget.activity.audio
                  ? const Text(
                      'Audio',
                      style: TextStyle(color: Colors.grey),
                    )
                  : const Text(
                      'Texto',
                      style: TextStyle(color: Colors.grey),
                    )
            ],
          ),
        )
      ],
    );
  }
}

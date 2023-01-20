import 'package:flutter/material.dart';

class DayElement extends StatelessWidget {
  final Widget content;
  final bool enable;

  const DayElement({
    Key? key,
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
      onPressed: enable ? () {} : null,
      style: style,
      child: content,
    );
  }
}

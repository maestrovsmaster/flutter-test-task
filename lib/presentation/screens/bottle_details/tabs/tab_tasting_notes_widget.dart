import 'package:flutter/material.dart';

class TabTastingNotesWidget extends StatelessWidget {
  const TabTastingNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1200,
      color: Colors.green,
      alignment: Alignment.center,
      child: const Text(
        'Tasting Notes Tab Content',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
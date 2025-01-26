import 'package:flutter/material.dart';

class TabHistoryWidget extends StatelessWidget {
  const TabHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1500,
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text(
        'History Tab Content',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
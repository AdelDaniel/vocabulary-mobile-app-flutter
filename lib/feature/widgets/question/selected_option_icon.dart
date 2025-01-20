import 'package:flutter/material.dart';

class SelectedOptionIcon extends StatelessWidget {
  const SelectedOptionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check_circle,
      color: Color(0xFF9DC1BC),
      size: 25,
    );
  }
}

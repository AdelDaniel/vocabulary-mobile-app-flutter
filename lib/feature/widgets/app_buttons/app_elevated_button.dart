import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  factory AppElevatedButton.withTitle({
    Key? key,
    VoidCallback? onPressed,
    required String title,
  }) {
    return AppElevatedButton(
      key: key,
      onPressed: onPressed,
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          
        ),
        elevation: 10,
      ),
      child: child,
    );
  }
}

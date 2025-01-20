import 'package:flutter/material.dart';
import 'package:voca_app/utils/extensions/themes_values_extension.dart';

class QuestionTitleText extends StatelessWidget {
  const QuestionTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: context.headlineLarge?.copyWith(
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:voca_app/utils/extensions/themes_values_extension.dart';

class QuestionDescriptionText extends StatelessWidget {
  const QuestionDescriptionText({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: context.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}

import 'package:flutter/material.dart';

import 'package:voca_app/feature/home/models/word_ui_model.dart';
import 'package:voca_app/utils/extensions/themes_values_extension.dart';

class WordPageWidget extends StatelessWidget {
  const WordPageWidget({
    super.key,
    required this.word,
  });

  final WordUiModel word;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              word.word,
              textAlign: TextAlign.center,
              style: context.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              word.pronunciation,
              style: context.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "(${word.partOfSpeech}) ${word.description}",
              style: context.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              word.exampleSentence,
              textAlign: TextAlign.center,
              style: context.bodyMedium?.copyWith(
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

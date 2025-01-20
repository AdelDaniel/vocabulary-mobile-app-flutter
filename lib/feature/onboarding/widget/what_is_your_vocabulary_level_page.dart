import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/question/single_selection_question_page.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class WhatIsYourVocabularyLevelPage extends StatefulWidget {
  final void Function({String? option}) onSelectVocabularyLevel;
  const WhatIsYourVocabularyLevelPage({
    super.key,
    required this.onSelectVocabularyLevel,
  });

  @override
  State<WhatIsYourVocabularyLevelPage> createState() =>
      _WhatIsYourVocabularyLevelPageState();
}

class _WhatIsYourVocabularyLevelPageState
    extends State<WhatIsYourVocabularyLevelPage> {
  static const List<String> _options = [
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleSelectionQuestionPage(
      showSkipButton: false,
      onSelectOption: widget.onSelectVocabularyLevel,
      title: context.translate(LocalizationKeys.whatIsYourVocabularyLevel),
      description: context.translate(LocalizationKeys.selectAnOptionToContinue),
      options: _options,
    );
  }
}

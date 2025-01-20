import 'package:flutter/material.dart';

import 'package:voca_app/feature/widgets/question/single_selection_question_page.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class DoYouGoalPage extends StatefulWidget {
  final void Function({String? option}) onSelectGoal;

  const DoYouGoalPage({
    super.key,
    required this.onSelectGoal,
  });

  @override
  State<DoYouGoalPage> createState() => _DoYouGoalPageState();
}

class _DoYouGoalPageState extends State<DoYouGoalPage> {
  static const List<String> _options = [
    'Enhance my lexicon',
    'Get ready for a test',
    'Improve my job prospects',
    'Enjoy learning new words',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleSelectionQuestionPage(
      onSelectOption: widget.onSelectGoal,
      title: context.translate(LocalizationKeys.doYouHaveSpecificGoal),
      description:
          context.translate(LocalizationKeys.selectAtLeastOneOptionToContinue),
      options: _options,
    );
  }
}

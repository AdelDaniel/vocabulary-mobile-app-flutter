import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/question/single_selection_question_page.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class HowMuchTimePage extends StatefulWidget {
  final void Function({String? option}) onSelectTimeToLearning;
  const HowMuchTimePage({
    super.key,
    required this.onSelectTimeToLearning,
  });

  @override
  State<HowMuchTimePage> createState() => _HowMuchTimePageState();
}

class _HowMuchTimePageState extends State<HowMuchTimePage> {
  static const List<String> _options = [
    '5 Minutes or less',
    '5 to 10 Minutes ',
    '10 to 15 Minutes',
    '15 Minutes or more',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleSelectionQuestionPage(
      showSkipButton: false,
      onSelectOption: widget.onSelectTimeToLearning,
      title: context
          .translate(LocalizationKeys.howMuchTimeWillYouDevoteToLearning),
      description:
          context.translate(LocalizationKeys.youCanAlwaysChangeYourGoal),
      options: _options,
    );
  }
}

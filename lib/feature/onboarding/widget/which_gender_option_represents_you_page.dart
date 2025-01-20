import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/question/single_selection_question_page.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class WhichGenderOptionRepresentsYouPage extends StatefulWidget {
  final void Function({String? option}) onSelectWhichGenderOptionRepresentsYou;

  const WhichGenderOptionRepresentsYouPage({
    super.key,
    required this.onSelectWhichGenderOptionRepresentsYou,
  });

  @override
  State<WhichGenderOptionRepresentsYouPage> createState() =>
      _WhichGenderOptionRepresentsYouPageState();
}

class _WhichGenderOptionRepresentsYouPageState
    extends State<WhichGenderOptionRepresentsYouPage> {
  static const List<String> _options = [
    'Female',
    'Male',
    'Other',
    'Prefer not to say',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleSelectionQuestionPage(
      onSelectOption: widget.onSelectWhichGenderOptionRepresentsYou,
      title: context.translate(LocalizationKeys.whichOptionRepresentsYouBest),
      description: context
          .translate(LocalizationKeys.youCanSelectAnOptionToContinueOrSkip),
      options: _options,
    );
  }
}

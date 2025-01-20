import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/question/single_selection_question_page.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class HowOldAreYouPage extends StatefulWidget {
  final void Function({String? option}) onSelectHowOldAreYou;
  const HowOldAreYouPage({super.key, required this.onSelectHowOldAreYou});

  @override
  State<HowOldAreYouPage> createState() => _HowOldAreYouPageState();
}

class _HowOldAreYouPageState extends State<HowOldAreYouPage> {
  static const List<String> _options = [
    '13 - 17',
    '18 - 24',
    '25 - 34',
    '35 - 44',
    '44 - 54',
    '54+',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleSelectionQuestionPage(
      onSelectOption: widget.onSelectHowOldAreYou,
      title: context.translate(LocalizationKeys.howOldAreYou),
      description: context
          .translate(LocalizationKeys.yourAgeIsUsedToPersonalizedYourContent),
      options: _options,
    );
  }
}

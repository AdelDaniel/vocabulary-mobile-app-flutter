import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/question/single_selection_question_page.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class HowDidYouHearPage extends StatefulWidget {
  final void Function({String? option}) onSelectHowDidYouHear;
  const HowDidYouHearPage({super.key, required this.onSelectHowDidYouHear});

  @override
  State<HowDidYouHearPage> createState() => _HowDidYouHearPageState();
}

class _HowDidYouHearPageState extends State<HowDidYouHearPage> {
  static const List<String> _options = [
    'TikTok',
    'Instagram',
    'Facebook',
    'Google Play',
    'Web search',
    'Friend/family',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleSelectionQuestionPage(
      onSelectOption: widget.onSelectHowDidYouHear,
      title: context.translate(LocalizationKeys.howDidYouHearAboutUs),
      description: context.translate(LocalizationKeys.selectAnOptionToContinue),
      options: _options,
    );
  }
}

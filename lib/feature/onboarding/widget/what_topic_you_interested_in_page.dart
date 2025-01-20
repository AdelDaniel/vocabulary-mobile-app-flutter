import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/question/multi_selection_question_page.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class WhatTopicYouInterestedInPage extends StatefulWidget {
  final void Function({Set<String> options}) onSelectTopic;

  const WhatTopicYouInterestedInPage({
    super.key,
    required this.onSelectTopic,
  });

  @override
  State<WhatTopicYouInterestedInPage> createState() =>
      _WhatTopicYouInterestedInPageState();
}

class _WhatTopicYouInterestedInPageState
    extends State<WhatTopicYouInterestedInPage> {
  static const List<String> _options = [
    'Society',
    'Words in foreign languages',
    'Human body',
    'Emotions',
    'Business',
    'Others',
  ];
  @override
  Widget build(BuildContext context) {
    return MultiSelectionQuestionPage(
      onSelectOptions: widget.onSelectTopic,
      title: context.translate(LocalizationKeys.whatTopicAreYouInterestedIn),
      description:
          context.translate(LocalizationKeys.selectAtLeastOneOptionToContinue),
      options: _options,
    );
  }
}

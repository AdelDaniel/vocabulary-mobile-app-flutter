import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/app_buttons/app_elevated_button.dart';
import 'package:voca_app/feature/widgets/question/question_description_text.dart';
import 'package:voca_app/feature/widgets/question/question_title_text.dart';
import 'package:voca_app/feature/widgets/question/skip_button_row.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';

import 'package:voca_app/utils/locale/app_localization_keys.dart';

class WhatDoYouWantToBeCalledPage extends StatefulWidget {
  final void Function({required String name}) onChooseName;
  const WhatDoYouWantToBeCalledPage({super.key, required this.onChooseName});

  @override
  State<WhatDoYouWantToBeCalledPage> createState() =>
      _WhatDoYouWantToBeCalledPageState();
}

class _WhatDoYouWantToBeCalledPageState
    extends State<WhatDoYouWantToBeCalledPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SkipButtonRow(
                    showSkipButton: true,
                    onPressed: _onPressSkip,
                  ),
                  const SizedBox(height: 15),
                  QuestionTitleText(
                    title: context.translate(
                      LocalizationKeys.whatDoYouWantToBeCalled,
                    ),
                  ),
                  const SizedBox(height: 15),
                  QuestionDescriptionText(
                    description: context.translate(
                      LocalizationKeys
                          .yourNameIsUsedToPersonalizeYourExperience,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: AppElevatedButton.withTitle(
              onPressed: _onPressSaveAndContinue,
              title: context.translate(LocalizationKeys.saveAndContinue),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  void _onPressSaveAndContinue() {
    widget.onChooseName(name: _controller.text);
  }

  void _onPressSkip() {
    widget.onChooseName(name: _controller.text);
  }
}

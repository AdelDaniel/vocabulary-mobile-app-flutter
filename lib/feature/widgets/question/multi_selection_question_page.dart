import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/question/option_button.dart';
import 'package:voca_app/feature/widgets/app_buttons/app_elevated_button.dart';
import 'package:voca_app/feature/widgets/question/question_description_text.dart';
import 'package:voca_app/feature/widgets/question/question_title_text.dart';
import 'package:voca_app/feature/widgets/question/skip_button_row.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class MultiSelectionQuestionPage extends StatefulWidget {
  final void Function({Set<String> options}) onSelectOptions;
  final String title;
  final String description;
  final List<String> options;
  final bool showSkipButton;

  const MultiSelectionQuestionPage({
    super.key,
    required this.onSelectOptions,
    required this.title,
    required this.description,
    required this.options,
    this.showSkipButton = true,
  });

  @override
  State<MultiSelectionQuestionPage> createState() =>
      _MultiSelectionQuestionPageState();
}

class _MultiSelectionQuestionPageState
    extends State<MultiSelectionQuestionPage> {
  final Set<String> _selectedOptions = {};
  List<String> get _options => widget.options;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          SkipButtonRow(
            showSkipButton: widget.showSkipButton,
            onPressed: () => _onSelectOption(""),
          ),
          const SizedBox(height: 15),
          QuestionTitleText(title: widget.title),
          const SizedBox(height: 15),
          QuestionDescriptionText(description: widget.description),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: _options.length,
              itemBuilder: (context, index) {
                return OptionButton(
                  option: _options[index],
                  isOptionSelected: _selectedOptions.contains(_options[index]),
                  onSelectOption: _onSelectOption,
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: AppElevatedButton.withTitle(
              onPressed:
                  _selectedOptions.isEmpty ? null : _onPressSaveAndContinue,
              title: context.translate(LocalizationKeys.saveAndContinue),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  void _onSelectOption(String option) {
    setState(() {
      if (_selectedOptions.contains(option)) {
        _selectedOptions.remove(option);
      } else {
        _selectedOptions.add(option);
      }
    });
  }

  void _onPressSaveAndContinue() {
    widget.onSelectOptions(options: _selectedOptions);
  }
}

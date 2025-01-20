import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/question/selected_option_icon.dart';
import 'package:voca_app/utils/extensions/themes_values_extension.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required String option,
    required bool isOptionSelected,
    required this.onSelectOption,
  })  : _option = option,
        _isOptionSelected = isOptionSelected;

  final String _option;
  final bool _isOptionSelected;
  final void Function(String) onSelectOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: _isOptionSelected
                ? Colors.white
                : Colors.white.withOpacity(0.5),
            width: _isOptionSelected ? 2 : 1,
          ),
        ),
        child: OutlinedButton(
          onPressed: () {
            onSelectOption(_option);
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            alignment: AlignmentDirectional.centerStart,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _option,
                textAlign: TextAlign.start,
                style: context.bodyLarge,
              ),
              AnimatedOpacity(
                opacity: _isOptionSelected ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: const SelectedOptionIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

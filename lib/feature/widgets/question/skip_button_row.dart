import 'package:flutter/material.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class SkipButtonRow extends StatelessWidget {
  const SkipButtonRow({
    super.key,
    required this.showSkipButton,
    this.onPressed,
  });

  final bool showSkipButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        if (showSkipButton)
          TextButton(
            onPressed: onPressed,
            child: Text(context.translate(LocalizationKeys.skip)),
          ),
      ],
    );
  }
}

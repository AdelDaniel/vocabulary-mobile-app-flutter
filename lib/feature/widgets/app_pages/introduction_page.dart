import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/app_buttons/app_elevated_button.dart';
import 'package:voca_app/utils/extensions/themes_values_extension.dart';

class IntroductionPage extends StatelessWidget {
  final String assetPath;
  final String title;
  final String subtitle;
  final String buttonLabel;
  final void Function() onPressed;

  const IntroductionPage({
    super.key,
    required this.assetPath,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(flex: 1),
          AspectRatio(aspectRatio: 1, child: Image.asset(assetPath)),
          const Spacer(flex: 1),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: context.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                subtitle,
                style: context.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton.withTitle(
                  onPressed: onPressed,
                  title: buttonLabel,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}

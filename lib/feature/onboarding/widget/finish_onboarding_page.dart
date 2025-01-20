import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/app_pages/introduction_page.dart';
import 'package:voca_app/res/app_asset_paths.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';
import 'package:voca_app/utils/lottie/celebration_lottie_widget.dart';

class FinishOnboardingPage extends StatefulWidget {
  final String name;
  final void Function() onPressContinue;
  const FinishOnboardingPage({
    super.key,
    required this.name,
    required this.onPressContinue,
  });

  @override
  State<FinishOnboardingPage> createState() => _FinishOnboardingPageState();
}

class _FinishOnboardingPageState extends State<FinishOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CelebrationLottieWidget(),
        IntroductionPage(
          assetPath: AppAssetPaths.tailorYourWordImage,
          title: _title,
          subtitle: context.translate(
            LocalizationKeys.customizeTheAppToMakeTheMostOfYourExperience,
          ),
          buttonLabel: context.translate(LocalizationKeys.continueWord),
          onPressed: widget.onPressContinue,
        ),
      ],
    );
  }

  String get _title =>
      "${context.translate(LocalizationKeys.letsMakeVocabularyYours)}$_name";
  String get _name => widget.name.isEmpty ? "" : ", ${widget.name}";
}

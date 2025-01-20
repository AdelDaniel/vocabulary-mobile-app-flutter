import 'package:flutter/material.dart';
import 'package:voca_app/feature/widgets/app_pages/introduction_page.dart';
import 'package:voca_app/res/app_asset_paths.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class TailorYourWordPage extends StatelessWidget {
  final void Function() onPressedTailorYourWord;
  const TailorYourWordPage({super.key, required this.onPressedTailorYourWord});

  @override
  Widget build(BuildContext context) {
    return IntroductionPage(
      assetPath: AppAssetPaths.tailorYourWordImage,
      title:
          context.translate(LocalizationKeys.tailorYourWordRecommendationTitle),
      subtitle: context
          .translate(LocalizationKeys.tailorYourWordRecommendationDescription),
      buttonLabel: context.translate(LocalizationKeys.continueWord),
      onPressed: onPressedTailorYourWord,
    );
  }
}

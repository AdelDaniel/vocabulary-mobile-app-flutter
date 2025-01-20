import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voca_app/app_router.dart';
import 'package:voca_app/feature/widgets/app_pages/introduction_page.dart';
import 'package:voca_app/res/app_asset_paths.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionPage(
        assetPath: AppAssetPaths.appLogo,
        title: context.translate(LocalizationKeys.expandYourVocabularies),
        subtitle: context.translate(LocalizationKeys.getStartedDescription),
        buttonLabel: context.translate(LocalizationKeys.getStarted),
        onPressed: () => _openOnboardingScreen(),
      ),
    );
  }

  ///////////////////////////////////////////////////////////
  /////////////////// Helper methods ////////////////////////
  ///////////////////////////////////////////////////////////

  void _openOnboardingScreen() {
    if (mounted) {
      context.go(AppRouter.onboardingScreenRouteName);
    }
  }
}

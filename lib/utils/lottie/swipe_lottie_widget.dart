import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:voca_app/res/app_asset_paths.dart';
import 'package:voca_app/utils/extensions/themes_values_extension.dart';

class SwipeLottieWidget extends StatefulWidget {
  const SwipeLottieWidget({super.key});

  @override
  State<SwipeLottieWidget> createState() => _SwipeLottieWidgetState();
}

class _SwipeLottieWidgetState extends State<SwipeLottieWidget> {
  bool _showLottie = true;
  @override
  Widget build(BuildContext context) {
    if (!_showLottie) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onVerticalDragEnd: (details) {
        _onVerticalDragEnd();
      },
      child: ColoredBox(
        color: const Color.fromRGBO(0, 0, 0, 0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset(
              AppAssetPaths.swipeLottie,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Swipe up or down to explore more words",
                style: context.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onVerticalDragEnd() => setState(() => _showLottie = false);
}

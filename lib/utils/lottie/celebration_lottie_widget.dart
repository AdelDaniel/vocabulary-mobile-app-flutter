import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:voca_app/res/app_asset_paths.dart';

class CelebrationLottieWidget extends StatefulWidget {
  const CelebrationLottieWidget({super.key});

  @override
  State<CelebrationLottieWidget> createState() =>
      _CelebrationLottieWidgetState();
}

class _CelebrationLottieWidgetState extends State<CelebrationLottieWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAssetPaths.celebrationLottie,
      controller: _controller,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward();
      },
      repeat: true,
    );
  }
}

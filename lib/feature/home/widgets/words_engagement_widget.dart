import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voca_app/res/app_asset_paths.dart';
import 'package:voca_app/utils/extensions/themes_values_extension.dart';

class WordsEngagementWidget extends StatelessWidget {
  final int wordsLearnNumber;
  const WordsEngagementWidget({super.key, required this.wordsLearnNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppAssetPaths.trophyIcon,
          height: 20,
        ),
        Text(
          "$wordsLearnNumber words",
          style: context.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voca_app/res/app_asset_paths.dart';
import 'package:voca_app/res/app_colors.dart';
import 'package:voca_app/utils/extensions/themes_values_extension.dart';

class DaysEngagementWidget extends StatelessWidget {
  final int daysStrikeNumber;
  const DaysEngagementWidget({super.key, required this.daysStrikeNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssetPaths.fireIcon,
          height: 25,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "$daysStrikeNumber",
                style: context.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.fireFont,
                ),
              ),
              TextSpan(
                text: " Days Streak",
                style: context.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.fireFont,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

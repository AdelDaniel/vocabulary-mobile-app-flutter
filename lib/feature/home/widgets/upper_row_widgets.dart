import 'package:flutter/material.dart';
import 'package:voca_app/feature/home/widgets/days_engagement_widget.dart';
import 'package:voca_app/feature/home/widgets/words_engagement_widget.dart';

class UpperRowWidgets extends StatelessWidget {
  const UpperRowWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DaysEngagementWidget(daysStrikeNumber: 10),
            WordsEngagementWidget(wordsLearnNumber: 1000),
          ],
        ),
      ),
    );
  }
}

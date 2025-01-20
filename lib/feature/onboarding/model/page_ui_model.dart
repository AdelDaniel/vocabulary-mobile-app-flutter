import 'package:flutter/material.dart';

class PageUiModel {
  final String stepTitle;
  final Icon stepIcon;
  final Widget page;

  const PageUiModel({
    required this.stepTitle,
    required this.stepIcon,
    required this.page,
  });
}


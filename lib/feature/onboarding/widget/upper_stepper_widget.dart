import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:voca_app/feature/onboarding/model/page_ui_model.dart';

class UpperStepperWidget extends StatelessWidget {
  const UpperStepperWidget({
    super.key,
    required int activeStepIndex,
    required List<PageUiModel> pages,
  })  : _activeStepIndex = activeStepIndex,
        _pages = pages;

  final int _activeStepIndex;
  final List<PageUiModel> _pages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: EasyStepper(
        activeStep: _activeStepIndex,
        stepRadius: 15,
        lineStyle: const LineStyle(
          lineLength: 50,
          lineThickness: 2,
          lineSpace: 2,
          lineType: LineType.normal,
        ),
        enableStepTapping: false,
        padding: EdgeInsets.zero,
        internalPadding: 2,
        borderThickness: 2,
        showLoadingAnimation: false,
        showTitle: false,
        steps: _pages.map((e) => EasyStep(icon: e.stepIcon)).toList(),
      ),
    );
  }
}

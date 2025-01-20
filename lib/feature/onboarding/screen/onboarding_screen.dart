import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:voca_app/app_router.dart';
import 'package:voca_app/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:voca_app/feature/onboarding/bloc/onboarding_repository.dart';
import 'package:voca_app/feature/onboarding/model/page_ui_model.dart';
import 'package:voca_app/feature/onboarding/widget/do_you_goal_page.dart';
import 'package:voca_app/feature/onboarding/widget/finish_onboarding_page.dart';
import 'package:voca_app/feature/onboarding/widget/how_did_you_hear_page.dart';
import 'package:voca_app/feature/onboarding/widget/how_much_time_page.dart';
import 'package:voca_app/feature/onboarding/widget/how_old_are_you_page.dart';
import 'package:voca_app/feature/onboarding/widget/upper_stepper_widget.dart';
import 'package:voca_app/feature/onboarding/widget/what_do_you_want_to_be_called_page.dart';
import 'package:voca_app/feature/onboarding/widget/what_is_your_vocabulary_level_page.dart';
import 'package:voca_app/feature/onboarding/widget/what_topic_you_interested_in_page.dart';
import 'package:voca_app/feature/onboarding/widget/which_gender_option_represents_you_page.dart';
import 'package:voca_app/feature/onboarding/widget/which_theme_page.dart';
import 'package:voca_app/feature/widgets/background/background_wrapper.dart';
import 'package:voca_app/preferences/preferences_manager.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';
import 'package:voca_app/utils/theme/theme_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (context) => OnboardingBloc(
        OnboardingRepository(GetIt.I<PreferencesManager>()),
      ),
      child: const OnboardingScreenWithBloc(),
    );
  }
}

class OnboardingScreenWithBloc extends StatefulWidget {
  const OnboardingScreenWithBloc({super.key});

  @override
  State<OnboardingScreenWithBloc> createState() {
    return _OnboardingScreenWithBloc();
  }
}

class _OnboardingScreenWithBloc extends State<OnboardingScreenWithBloc>
    with SingleTickerProviderStateMixin {
  String _name = "";
  int _activeStepIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeInFadeOut;

  List<PageUiModel> get _pages => [
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(Icons.waving_hand_rounded),
          page: HowDidYouHearPage(
            onSelectHowDidYouHear: _onSelectHowDidYouHear,
          ),
        ),
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(Icons.calendar_month_rounded),
          page: HowOldAreYouPage(
            onSelectHowOldAreYou: _onSelectHowOldAreYou,
          ),
        ),
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(Icons.question_mark_rounded),
          page: WhichGenderOptionRepresentsYouPage(
            onSelectWhichGenderOptionRepresentsYou:
                _onSelectWhichGenderOptionRepresentsYou,
          ),
        ),
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(Icons.person_rounded),
          page: WhatDoYouWantToBeCalledPage(onChooseName: _onChooseName),
        ),
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(CupertinoIcons.book_fill),
          page: WhatIsYourVocabularyLevelPage(
            onSelectVocabularyLevel: _onSelectVocabularyLevel,
          ),
        ),
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(CupertinoIcons.time),
          page:
              HowMuchTimePage(onSelectTimeToLearning: _onSelectTimeToLearning),
        ),
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(Icons.color_lens_rounded),
          page: WhichThemePage(onSelectTheme: _onSelectTheme),
        ),
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(Icons.track_changes_outlined),
          page: DoYouGoalPage(onSelectGoal: _onSelectGoal),
        ),
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(Icons.topic_outlined),
          page: WhatTopicYouInterestedInPage(onSelectTopic: _onSelectTopics),
        ),
        PageUiModel(
          stepTitle: context.translate(LocalizationKeys.hi),
          stepIcon: const Icon(Icons.celebration_rounded),
          page: FinishOnboardingPage(
            name: _name,
            onPressContinue: _onPressContinueToFinish,
          ),
        ),
      ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeInFadeOut = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OpenNextPageState) {
          _activeStepIndex++;
          _animationController.forward(from: 0.0);
        } else if (state is OpenHomeScreenState) {
          _navigateToOpenHomeScreen();
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: BackgroundWrapper(
              child: Column(
                children: [
                  UpperStepperWidget(
                    activeStepIndex: _activeStepIndex,
                    pages: _pages,
                  ),
                  Expanded(
                    child: FadeTransition(
                      opacity: _fadeInFadeOut,
                      child: _pages[_activeStepIndex].page,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ///////////////////////////////////////////////////////////
  /////////////////// Helper methods ////////////////////////
  ///////////////////////////////////////////////////////////

  OnboardingBloc get _onboardingBloc => context.read<OnboardingBloc>();
  ThemeCubit get _themeCubit => context.read<ThemeCubit>();

  void _onSelectHowDidYouHear({String? option}) {
    _onboardingBloc.add(HowDidYouHearSelectedEvent(option: option));
  }

  void _onSelectHowOldAreYou({String? option}) {
    _onboardingBloc.add(AgeRangeSelectedEvent(option: option));
  }

  void _onSelectWhichGenderOptionRepresentsYou({String? option}) {
    _onboardingBloc.add(GenderSelectedEvent(option: option));
  }

  void _onSelectGoal({String? option}) {
    _onboardingBloc.add(GoalSelectedEvent(option: option));
  }

  void _onChooseName({required String name}) {
    _name = name;
    _onboardingBloc.add(NameChangedEvent(name: name));
  }

  void _onSelectTopics({Set<String> options = const {}}) {
    _onboardingBloc.add(TopicSelectedEvent(options: options));
  }

  void _onSelectTheme({String? option}) {
    _themeCubit.changeImageTheme(option);
    _onboardingBloc.add(ThemeSelectedEvent(option: option));
  }

  void _onSelectTimeToLearning({String? option}) {
    _onboardingBloc.add(LearningTimeSelectedEvent(option: option));
  }

  void _onPressContinueToFinish() {
    _onboardingBloc.add(const FinishOnboardingEvent());
  }

  void _onSelectVocabularyLevel({String? option}) {
    _onboardingBloc.add(VocabularyLevelSelectedEvent(option: option));
  }

  void _navigateToOpenHomeScreen() {
    context.go(AppRouter.homeScreenRouteName);
  }
}

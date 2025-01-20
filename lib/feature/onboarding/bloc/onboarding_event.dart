part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class HowDidYouHearSelectedEvent extends OnboardingEvent {
  final String? option;
  const HowDidYouHearSelectedEvent({this.option});
}

class AgeRangeSelectedEvent extends OnboardingEvent {
  final String? option;
  const AgeRangeSelectedEvent({required this.option});
}

class GenderSelectedEvent extends OnboardingEvent {
  final String? option;
  const GenderSelectedEvent({required this.option});
}

class GoalSelectedEvent extends OnboardingEvent {
  final String? option;
  const GoalSelectedEvent({required this.option});
}

class NameChangedEvent extends OnboardingEvent {
  final String? name;
  const NameChangedEvent({required this.name});
}

class TopicSelectedEvent extends OnboardingEvent {
  final Set<String> options;
  const TopicSelectedEvent({required this.options});
}

class ThemeSelectedEvent extends OnboardingEvent {
  final String? option;
  const ThemeSelectedEvent({required this.option});
}

class LearningTimeSelectedEvent extends OnboardingEvent {
  final String? option;
  const LearningTimeSelectedEvent({required this.option});
}

class FinishOnboardingEvent extends OnboardingEvent {
  const FinishOnboardingEvent();
}

class VocabularyLevelSelectedEvent extends OnboardingEvent {
  final String? option;
  const VocabularyLevelSelectedEvent({required this.option});
}

class GetStartedClickedEvent extends OnboardingEvent {}

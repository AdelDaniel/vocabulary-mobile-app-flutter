import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_app/feature/onboarding/bloc/onboarding_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final BaseOnboardingRepository onboardingRepository;

  OnboardingBloc(this.onboardingRepository)
      : super(const OnboardingInitialState()) {
    on<HowDidYouHearSelectedEvent>(_howDidYouHearSelectedEvent);
    on<AgeRangeSelectedEvent>(_ageRangeSelectedEvent);
    on<GenderSelectedEvent>(_genderSelectedEvent);
    on<GoalSelectedEvent>(_goalSelectedEvent);
    on<NameChangedEvent>(_nameChangedEvent);
    on<TopicSelectedEvent>(_topicSelectedEvent);
    on<ThemeSelectedEvent>(_themeSelectedEvent);
    on<LearningTimeSelectedEvent>(_learningTimeSelectedEvent);
    on<FinishOnboardingEvent>(_finishOnboardingEvent);
    on<VocabularyLevelSelectedEvent>(_vocabularyLevelSelectedEvent);
  }

  FutureOr<void> _howDidYouHearSelectedEvent(
    HowDidYouHearSelectedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository
        .saveSelectedHowUserHeardAboutApp(event.option));
  }

  FutureOr<void> _ageRangeSelectedEvent(
    AgeRangeSelectedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository.saveSelectedAgeRange(event.option));
  }

  FutureOr<void> _genderSelectedEvent(
    GenderSelectedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository.saveSelectedGender(event.option));
  }

  FutureOr<void> _goalSelectedEvent(
    GoalSelectedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository.saveSelectedGoal(event.option));
  }

  FutureOr<void> _nameChangedEvent(
    NameChangedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository.saveUserName(event.name));
  }

  FutureOr<void> _topicSelectedEvent(
    TopicSelectedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository.saveSelectedTopic(event.options));
  }

  FutureOr<void> _themeSelectedEvent(
    ThemeSelectedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository.saveSelectedTheme(event.option));
  }

  FutureOr<void> _learningTimeSelectedEvent(
    LearningTimeSelectedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository.saveSelectedLearningTime(event.option));
  }

  FutureOr<void> _finishOnboardingEvent(
    FinishOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository.finishOnboardingEvent());
  }

  FutureOr<void> _vocabularyLevelSelectedEvent(
    VocabularyLevelSelectedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const LoadingState());
    emit(await onboardingRepository.saveSelectedVocabularyLevel(event.option));
  }
}

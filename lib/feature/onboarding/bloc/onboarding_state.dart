part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();
  @override
  List<Object> get props => [];
}

final class OnboardingInitialState extends OnboardingState {
  const OnboardingInitialState();
}

class LoadingState extends OnboardingState {
  const LoadingState();
}

class OpenNextPageState extends OnboardingState {
  const OpenNextPageState();
}

class OpenHomeScreenState extends OnboardingState {
  const OpenHomeScreenState();
}

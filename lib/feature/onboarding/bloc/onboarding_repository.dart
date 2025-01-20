import 'package:voca_app/preferences/preferences_manager.dart';
import 'onboarding_bloc.dart';

abstract class BaseOnboardingRepository {
  const BaseOnboardingRepository();
  Future<OnboardingState> saveSelectedHowUserHeardAboutApp(String? value);
  Future<OnboardingState> saveSelectedAgeRange(String? value);
  Future<OnboardingState> saveSelectedGender(String? value);
  Future<OnboardingState> saveSelectedGoal(String? value);
  Future<OnboardingState> saveUserName(String? value);
  Future<OnboardingState> saveSelectedTopic(Set<String> value);
  Future<OnboardingState> saveSelectedTheme(String? value);
  Future<OnboardingState> saveSelectedLearningTime(String? value);
  Future<OnboardingState> finishOnboardingEvent();
  Future<OnboardingState> saveSelectedVocabularyLevel(String? value);
}

class OnboardingRepository implements BaseOnboardingRepository {
  final PreferencesManager preferencesManager;
  const OnboardingRepository(this.preferencesManager);

  @override
  Future<OnboardingState> saveSelectedHowUserHeardAboutApp(
      String? value) async {
    /// here we can handle any method related to how the user heard about us
    return const OpenNextPageState();
  }

  @override
  Future<OnboardingState> saveUserName(String? value) async {
    await preferencesManager.setName(value ?? "");
    return const OpenNextPageState();
  }

  @override
  Future<OnboardingState> saveSelectedAgeRange(String? value) async {
    /// Save data in local and in the end save it in API
    return const OpenNextPageState();
  }

  @override
  Future<OnboardingState> saveSelectedGender(String? value) async {
    /// Save data in local and in the end save it in API
    return const OpenNextPageState();
  }

  @override
  Future<OnboardingState> saveSelectedGoal(String? value) async {
    /// Save data in local and in the end save it in API
    return const OpenNextPageState();
  }

  @override
  Future<OnboardingState> saveSelectedLearningTime(String? value) async {
    /// Save data in local and in the end save it in API
    return const OpenNextPageState();
  }

  @override
  Future<OnboardingState> saveSelectedTheme(String? value) async {
    if (value != null) {
      await preferencesManager.setThemeImage(value);
    }
    return const OpenNextPageState();
  }

  @override
  Future<OnboardingState> saveSelectedTopic(Set<String> value) async {
    /// Save data in local and in the end save it in API
    return const OpenNextPageState();
  }

  @override
  Future<OnboardingState> saveSelectedVocabularyLevel(String? value) async {
    /// Save data in local and in the end save it in API
    return const OpenNextPageState();
  }

  @override
  Future<OnboardingState> finishOnboardingEvent() async {
    /// Save data in API
    /// then open the home screen
    return const OpenHomeScreenState();
  }
}

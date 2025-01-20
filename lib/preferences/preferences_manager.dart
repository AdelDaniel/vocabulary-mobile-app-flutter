import 'package:voca_app/preferences/preferences_keys.dart';
import 'package:voca_app/utils/preferences/preferences_utils.dart';

class PreferencesManager {
  Future<bool> clearData() async {
    String? locale = await getLocale();
    await PreferencesUtils.clearData();
    if (locale != null) await setLocale(locale);

    return true;
  }

  Future<bool> setLocale(String data) async {
    return await PreferencesUtils.setString(PreferencesKeys.lang.name, data);
  }

  Future<String?> getLocale() async {
    return await PreferencesUtils.getString(PreferencesKeys.lang.name);
  }

  Future<void> setIsCompleteOnboarding() async {
    await PreferencesUtils.setBool(
        PreferencesKeys.isCompleteOnboarding.name, true);
  }

  Future<bool?> isCompleteOnboarding() async {
    return PreferencesUtils.getBool(PreferencesKeys.isCompleteOnboarding.name);
  }

  Future<void> setName(String data) async {
    await PreferencesUtils.setString(PreferencesKeys.name.name, data);
  }

  Future<String?> getName() async {
    return await PreferencesUtils.getString(PreferencesKeys.name.name);
  }

  Future<bool?> getDarkModeStatus() async {
    return PreferencesUtils.getBool(PreferencesKeys.darkMode.name);
  }

  Future<bool> setDarkModeStatus(bool data) async {
    return await PreferencesUtils.setBool(PreferencesKeys.darkMode.name, data);
  }

  Future<String?> getThemeImage() async {
    return await PreferencesUtils.getString(PreferencesKeys.theme.name);
  }

  Future<bool> setThemeImage(String data) async {
    return await PreferencesUtils.setString(PreferencesKeys.theme.name, data);
  }
}

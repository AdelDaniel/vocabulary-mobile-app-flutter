import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_app/preferences/preferences_manager.dart';
import 'package:voca_app/utils/theme/app_theme.dart';

class ThemeCubit extends Cubit<BaseAppTheme> {
  final PreferencesManager preferenceManager;

  ThemeCubit(this.preferenceManager) : super(const LightAppTheme()) {
    _getDefaultTheme();
  }

  Future<void> toggleTheme() async {
    final isDarkMode = await preferenceManager.getDarkModeStatus() ?? true;
    await changeTheme(!isDarkMode);
  }

  Future<void> _getDefaultTheme() async {
    final isDarkMode = await preferenceManager.getDarkModeStatus();
    final themeImage = await preferenceManager.getThemeImage();
    final BaseAppTheme theme;
    if (isDarkMode == true || isDarkMode == null) {
      theme = DarkAppTheme(imageTheme: themeImage);
    } else {
      theme = LightAppTheme(imageTheme: themeImage);
    }
    emit(theme);
  }

  Future<void> changeTheme(bool isDark) async {
    final themeImage = await preferenceManager.getThemeImage();
    final theme = isDark
        ? DarkAppTheme(imageTheme: themeImage)
        : LightAppTheme(imageTheme: themeImage);
    emit(theme);
    await preferenceManager.setDarkModeStatus(isDark);
  }

  Future<void> changeImageTheme(String? image) async {
    emit(state.copyWith(imageTheme: image));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voca_app/preferences/preferences_manager.dart';
import 'package:voca_app/utils/locale/app_localization.dart';

class LocaleCubit extends Cubit<Locale> {
  final PreferencesManager preferenceManager;

  LocaleCubit(this.preferenceManager) : super(const Locale(codeAr)) {
    getDefaultLocale();
  }

  void changeLocale(LocaleApp selectedLanguage) async {
    final defaultLanguageCode = await preferenceManager.getLocale();

    if (selectedLanguage == LocaleApp.ar && defaultLanguageCode != codeAr) {
      emit(const Locale(codeAr));
      await preferenceManager.setLocale(codeAr);
    } else if (selectedLanguage == LocaleApp.en &&
        defaultLanguageCode != codeEn) {
      emit(const Locale(codeEn));
      await preferenceManager.setLocale(codeEn);
    }
  }

  void getDefaultLocale() async {
    final defaultLanguageCode = await preferenceManager.getLocale();
    Locale locale;
    if (defaultLanguageCode == null) {
      locale = Locale(_appDefaultCode);
      await preferenceManager.setLocale(locale.languageCode);
    } else {
      locale = Locale(defaultLanguageCode);
      if (locale.languageCode == codeEn) {
        await preferenceManager.setLocale(locale.languageCode);
      } else {
        await preferenceManager.setLocale(locale.languageCode);
      }
    }
    emit(locale);
  }

  String get _appDefaultCode => codeAr;
  String get defaultSystemLocale => Platform.localeName.substring(0, 2);
}

enum LocaleApp { en, ar }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'package:voca_app/app_router.dart';
import 'package:voca_app/preferences/preferences_manager.dart';
import 'package:voca_app/utils/locale/app_localization.dart';
import 'package:voca_app/utils/locale/locale_cubit.dart';

import 'package:voca_app/utils/theme/app_theme.dart';
import 'package:voca_app/utils/theme/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit(GetIt.I<PreferencesManager>()),
        ),
        BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(GetIt.I<PreferencesManager>())),
      ],
      child: BlocBuilder<ThemeCubit, BaseAppTheme>(
        builder: (context, appThemeState) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: "Voca4Ever",
                theme: appThemeState.themeData,
                themeMode: appThemeState is DarkAppTheme
                    ? ThemeMode.dark
                    : ThemeMode.light,

                /// the list of our supported locals for our app
                /// currently we support only 2 English and Arabic ...
                supportedLocales: AppLocalizations.supportedLocales,

                /// these delegates make sure that the localization data
                /// for the proper
                /// language is loaded ...
                localizationsDelegates: const [
                  /// A class which loads the translations from JSON files
                  AppLocalizations.delegate,

                  /// Built-in localization of basic text
                  ///  for Material widgets in Material
                  GlobalMaterialLocalizations.delegate,

                  /// Built-in localization for text direction LTR/RTL
                  GlobalWidgetsLocalizations.delegate,

                  /// Built-in localization for text direction LTR/RTL in Cupertino
                  GlobalCupertinoLocalizations.delegate,

                  DefaultCupertinoLocalizations.delegate
                ],
                // locale: state,
                routerConfig: AppRouter.router,
              );
            },
          );
        },
      ),
    );
  }
}

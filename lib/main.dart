import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:voca_app/my_app.dart';
import 'package:voca_app/preferences/preferences_manager.dart';
import 'package:voca_app/utils/bloc_observer/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    /// setup GetIt Instances ...
    GetIt.I.registerLazySingleton<PreferencesManager>(
      () => PreferencesManager(),
    );

    Bloc.observer = AppBlocObserver();
    runApp(const MyApp());
  });
}

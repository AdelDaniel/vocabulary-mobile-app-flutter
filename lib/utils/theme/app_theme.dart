import 'package:flutter/material.dart';

abstract class BaseAppTheme {
  ThemeData get themeData;
  String? get imageTheme;
  BaseAppTheme copyWith({String? imageTheme});
}

class LightAppTheme implements BaseAppTheme {
  @override
  final String? imageTheme;
  const LightAppTheme({this.imageTheme});

  /// The Light Theme
  @override
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
    );
  }

  @override
  BaseAppTheme copyWith({String? imageTheme}) {
    return LightAppTheme(imageTheme: imageTheme ?? this.imageTheme);
  }
}

class DarkAppTheme implements BaseAppTheme {
  @override
  final String? imageTheme;
  const DarkAppTheme({this.imageTheme});

  /// The Dark Theme
  @override
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
    );
  }

  @override
  BaseAppTheme copyWith({String? imageTheme}) {
    return DarkAppTheme(imageTheme: imageTheme ?? this.imageTheme);
  }
}

abstract final class AppAssetPaths {
  const AppAssetPaths._();

  /// Images
  static const appLogo = "assets/images/vocabulary_logo.png";
  static const tailorYourWordImage = "assets/images/tailor_your_word.png";

  /// Lottie Fils
  static const celebrationLottie = "assets/lottie/celebration.json";
  static const swipeLottie = "assets/lottie/swipe_lottie.json";

  /// Themes

  static String _getThemeImage(int number) =>
      "assets/images/themes/theme$number.jpg";

  static final List<String> themesImage = List.generate(6, _getThemeImage);

  /// Icons
}

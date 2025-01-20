import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_app/feature/widgets/question/question_description_text.dart';
import 'package:voca_app/feature/widgets/question/question_title_text.dart';

import 'package:voca_app/feature/widgets/question/selected_option_icon.dart';
import 'package:voca_app/feature/widgets/app_buttons/app_elevated_button.dart';
import 'package:voca_app/res/app_asset_paths.dart';
import 'package:voca_app/utils/extensions/extension_localization.dart';
import 'package:voca_app/utils/extensions/themes_values_extension.dart';
import 'package:voca_app/utils/locale/app_localization_keys.dart';
import 'package:voca_app/utils/theme/theme_cubit.dart';

class WhichThemePage extends StatefulWidget {
  final void Function({String? option}) onSelectTheme;
  const WhichThemePage({super.key, required this.onSelectTheme});

  @override
  State<WhichThemePage> createState() => _WhichThemePageState();
}

class _WhichThemePageState extends State<WhichThemePage> {
  String? _selectedOption;
  final List<String> _themes = AppAssetPaths.themesImage;

  @override
  void initState() {
    super.initState();
    Future.microtask(_getInitImageTheme);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: _selectedOption == null
            ? null
            : DecorationImage(
                image: AssetImage(_selectedOption!),
                fit: BoxFit.cover,
                opacity: 0.8,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          QuestionTitleText(
            title: context.translate(
              LocalizationKeys.whichThemeWouldYouLikeToStartWith,
            ),
          ),
          const SizedBox(height: 15),
          QuestionDescriptionText(
            description: context.translate(
              LocalizationKeys.chooseFromALargeSelectionOfThemes,
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: _themes.length,
              itemBuilder: (context, index) {
                final themeImage = _themes[index];
                return GestureDetector(
                  onTap: () => _onSelectOption(themeImage),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(themeImage),
                            fit: BoxFit.cover,
                            opacity: 0.8,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Abcd',
                            style: context.bodyLarge,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: AnimatedOpacity(
                          opacity: _selectedOption == themeImage ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: const SelectedOptionIcon(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: AppElevatedButton.withTitle(
              onPressed:
                  _selectedOption == null ? null : _onPressSaveAndContinue,
              title: context.translate(LocalizationKeys.saveAndContinue),
            ),
          ),
        ],
      ),
    );
  }

  void _onSelectOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  _getInitImageTheme() {
    _selectedOption = context.read<ThemeCubit>().state.imageTheme;
  }

  void _onPressSaveAndContinue() {
    widget.onSelectTheme(option: _selectedOption);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_app/utils/theme/theme_cubit.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final imageTheme = context.read<ThemeCubit>().state.imageTheme;
    return Container(
      decoration: BoxDecoration(
        image: imageTheme == null
            ? null
            : DecorationImage(
                image: AssetImage(imageTheme),
                fit: BoxFit.cover,
                opacity: 0.8,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
      ),
      child: child,
    );
  }
}

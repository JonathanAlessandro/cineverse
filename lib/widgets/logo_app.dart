import 'package:cineverse/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Logotipo da plataforma CineVerse (texto com o gradiente da marca).
class LogoApp extends StatelessWidget {
  const LogoApp({super.key, this.fontSize = 22});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(
        colors: AppColors.brandGradient,
      ).createShader(bounds),
      child: Text(
        'CineVerse',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
          color: Colors.white,
        ),
      ),
    );
  }
}

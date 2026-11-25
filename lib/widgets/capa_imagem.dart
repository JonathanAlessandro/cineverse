import 'package:cineverse/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Imagem de capa com carregamento e fallback.
///
/// Se a imagem não puder ser carregada (ex.: sem internet), exibe um
/// placeholder com o gradiente da marca, garantindo que o layout continue
/// apresentável.
class CapaImagem extends StatelessWidget {
  const CapaImagem({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.radius = 16,
    this.fit = BoxFit.cover,
  });

  final String url;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return _Placeholder(width: width, height: height, carregando: true);
        },
        errorBuilder: (context, error, stack) {
          return _Placeholder(width: width, height: height);
        },
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({
    this.width,
    this.height,
    this.carregando = false,
  });

  final double? width;
  final double? height;
  final bool carregando;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.brandGradient,
        ),
      ),
      alignment: Alignment.center,
      child: carregando
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white70,
              ),
            )
          : const Icon(
              Icons.movie_creation_outlined,
              color: Colors.white70,
              size: 30,
            ),
    );
  }
}

import 'package:cineverse/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Título de seção com uma barra de destaque ao lado esquerdo,
/// acompanhado de um atalho opcional ("Ver tudo").
class TituloSecao extends StatelessWidget {
  const TituloSecao({
    super.key,
    required this.titulo,
    this.onVerTudo,
  });

  final String titulo;
  final VoidCallback? onVerTudo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: AppColors.brandGradient),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                letterSpacing: 0.2,
              ),
            ),
          ),
          if (onVerTudo != null)
            TextButton(
              onPressed: onVerTudo,
              child: const Text('Ver tudo'),
            ),
        ],
      ),
    );
  }
}

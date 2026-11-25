import 'package:cineverse/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Campo de busca padronizado (visual). O comportamento funcional não é
/// obrigatório neste projeto, mas o componente deixa o layout coerente.
class CampoBusca extends StatelessWidget {
  const CampoBusca({
    super.key,
    this.hint = 'Buscar filmes e séries',
    this.readOnly = false,
    this.onTap,
  });

  final String hint;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(color: AppColors.textPrimary, fontSize: 15),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 15),
        prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textSecondary),
        filled: true,
        fillColor: AppColors.surfaceSoft,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: _borda(),
        enabledBorder: _borda(),
        focusedBorder: _borda(destaque: true),
      ),
    );
  }

  OutlineInputBorder _borda({bool destaque = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: destaque ? AppColors.primary : AppColors.cardBorder,
      ),
    );
  }
}

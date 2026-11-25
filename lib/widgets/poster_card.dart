import 'package:cineverse/model/conteudo.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:cineverse/utils/navegacao.dart';
import 'package:cineverse/widgets/capa_imagem.dart';
import 'package:flutter/material.dart';

/// Card padronizado de um título (capa + nota + informações).
///
/// Funciona tanto em listas horizontais (com largura fixa) quanto em grades
/// (preenchendo a célula). Ao tocar, abre a tela de detalhes.
class PosterCard extends StatelessWidget {
  const PosterCard({
    super.key,
    required this.conteudo,
    this.largura,
  });

  final Conteudo conteudo;
  final double? largura;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => abrirDetalhes(context, conteudo),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CapaImagem(url: conteudo.imagem),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: _NotaChip(nota: conteudo.nota),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                conteudo.titulo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${conteudo.ano} • ${conteudo.tipo}',
                style: const TextStyle(
                  fontSize: 11.5,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotaChip extends StatelessWidget {
  const _NotaChip({required this.nota});

  final double nota;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, size: 13, color: AppColors.accent),
          const SizedBox(width: 3),
          Text(
            nota.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cineverse/data/catalogo.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:cineverse/widgets/campo_busca.dart';
import 'package:cineverse/widgets/poster_card.dart';
import 'package:flutter/material.dart';

/// TELA 4 - Pesquisa.
///
/// O campo de pesquisa ainda não é funcional; os resultados são exemplos
/// fixos (placeholder) definidos no código.
class PesquisaScreen extends StatelessWidget {
  const PesquisaScreen({super.key});

  static const List<String> _resultadosIds = [
    'cidade-neon',
    'sombras-na-neblina',
    'codigo-zero',
    'a-heranca',
    'verao-em-marte',
    'o-silencio',
  ];

  static const List<String> _buscasPopulares = [
    'Ação',
    'Séries',
    'Terror',
    'Ficção',
    '2025',
  ];

  @override
  Widget build(BuildContext context) {
    final resultados =
        _resultadosIds.map((id) => Catalogo.porId(id)).toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Pesquisa')),
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
            sliver: SliverToBoxAdapter(
              child: CampoBusca(hint: 'O que você quer assistir?'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 4),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Buscas populares',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _buscasPopulares
                        .map((termo) => _ChipTermo(texto: termo))
                        .toList(),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Resultados',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 16,
                childAspectRatio: 0.56,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    PosterCard(conteudo: resultados[index]),
                childCount: resultados.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipTermo extends StatelessWidget {
  const _ChipTermo({required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.surfaceSoft,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.trending_up_rounded,
              size: 15, color: AppColors.secondary),
          const SizedBox(width: 6),
          Text(
            texto,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

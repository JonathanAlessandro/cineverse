import 'package:cineverse/data/catalogo.dart';
import 'package:cineverse/model/conteudo.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:cineverse/widgets/campo_busca.dart';
import 'package:cineverse/widgets/poster_card.dart';
import 'package:flutter/material.dart';

/// TELA 2 - Explorar.
///
/// Campo de pesquisa visual, categorias de conteúdo e catálogo em grade.
class ExplorarScreen extends StatefulWidget {
  const ExplorarScreen({super.key});

  @override
  State<ExplorarScreen> createState() => _ExplorarScreenState();
}

class _ExplorarScreenState extends State<ExplorarScreen> {
  static const String _todas = 'Todas';
  String _categoriaSelecionada = _todas;

  List<Conteudo> get _itens => _categoriaSelecionada == _todas
      ? Catalogo.todos
      : Catalogo.porCategoria(_categoriaSelecionada);

  @override
  Widget build(BuildContext context) {
    final categorias = [_todas, ...Catalogo.categorias];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Explorar')),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CampoBusca(
                    readOnly: true,
                    onTap: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            content: Text('Use a aba "Pesquisa" para buscar.'),
                          ),
                        );
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Categorias',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: categorias.length,
                separatorBuilder: (_, _) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  final selecionada = categoria == _categoriaSelecionada;
                  return _ChipCategoria(
                    texto: categoria,
                    selecionada: selecionada,
                    onTap: () =>
                        setState(() => _categoriaSelecionada = categoria),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 16,
                childAspectRatio: 0.56,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => PosterCard(conteudo: _itens[index]),
                childCount: _itens.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipCategoria extends StatelessWidget {
  const _ChipCategoria({
    required this.texto,
    required this.selecionada,
    required this.onTap,
  });

  final String texto;
  final bool selecionada;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          gradient: selecionada
              ? const LinearGradient(colors: AppColors.brandGradient)
              : null,
          color: selecionada ? null : AppColors.surfaceSoft,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selecionada ? Colors.transparent : AppColors.cardBorder,
          ),
        ),
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selecionada ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

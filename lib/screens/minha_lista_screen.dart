import 'package:cineverse/data/catalogo.dart';
import 'package:cineverse/data/favoritos.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:cineverse/utils/navegacao.dart';
import 'package:cineverse/widgets/capa_imagem.dart';
import 'package:flutter/material.dart';

/// TELA 5 - Minha lista.
///
/// Lista de títulos favoritos com capa, nome e informações, com opção de
/// remover. Os dados são mantidos em memória.
class MinhaListaScreen extends StatelessWidget {
  const MinhaListaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Minha lista')),
      body: ListenableBuilder(
        listenable: Favoritos.instance,
        builder: (context, _) {
          final itens = Favoritos.instance.emOrdem
              .map((id) => Catalogo.porId(id))
              .toList();

          if (itens.isEmpty) {
            return const _Vazio();
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
            itemCount: itens.length,
            separatorBuilder: (_, _) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final conteudo = itens[index];
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => abrirDetalhes(context, conteudo),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.cardBorder),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CapaImagem(
                          url: conteudo.imagem,
                          width: 62,
                          height: 92,
                          radius: 12,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                conteudo.titulo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${conteudo.genero} • ${conteudo.ano}',
                                style: const TextStyle(
                                  fontSize: 12.5,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star_rounded,
                                      size: 15, color: AppColors.accent),
                                  const SizedBox(width: 4),
                                  Text(
                                    conteudo.nota.toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    conteudo.tipo,
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          tooltip: 'Remover da lista',
                          onPressed: () => Favoritos.instance.alternar(conteudo.id),
                          icon: const Icon(Icons.delete_outline_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _Vazio extends StatelessWidget {
  const _Vazio();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: AppColors.surfaceSoft,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: const Icon(Icons.bookmark_border_rounded,
                  size: 38, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 18),
            const Text(
              'Sua lista está vazia',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Adicione filmes e séries tocando em\n"Adicionar à minha lista".',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

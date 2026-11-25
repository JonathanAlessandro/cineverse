import 'package:cineverse/data/catalogo.dart';
import 'package:cineverse/data/favoritos.dart';
import 'package:cineverse/model/conteudo.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:cineverse/utils/navegacao.dart';
import 'package:cineverse/widgets/capa_imagem.dart';
import 'package:flutter/material.dart';

/// Banner de destaque da Home: imagem ampla, sobreposição em gradiente e
/// as principais ações (Assistir e Adicionar à minha lista).
class BannerDestaque extends StatelessWidget {
  const BannerDestaque({super.key, required this.conteudo});

  final Conteudo conteudo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CapaImagem(url: Catalogo.imagemBanner, radius: 0),
          // Sobreposição para dar contraste ao texto.
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x22000000),
                  Color(0x66000000),
                  AppColors.backgroundStart,
                ],
                stops: [0.0, 0.55, 1.0],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SeloOriginal(),
                const SizedBox(height: 12),
                Text(
                  conteudo.titulo,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 0.3,
                    height: 1.05,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '${conteudo.ano}',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 10),
                    _Classificacao(texto: conteudo.classificacao),
                    const SizedBox(width: 10),
                    Text(
                      conteudo.genero,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.star_rounded,
                        size: 15, color: AppColors.accent),
                    const SizedBox(width: 3),
                    Text(
                      conteudo.nota.toStringAsFixed(1),
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => abrirDetalhes(context, conteudo),
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: const Text('Assistir'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    _BotaoMinhaLista(conteudo: conteudo),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SeloOriginal extends StatelessWidget {
  const _SeloOriginal();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: AppColors.brandGradient),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'CINEVERSE',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Original',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class _BotaoMinhaLista extends StatelessWidget {
  const _BotaoMinhaLista({required this.conteudo});

  final Conteudo conteudo;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Favoritos.instance,
      builder: (context, _) {
        final adicionado = Favoritos.instance.contem(conteudo.id);
        return OutlinedButton(
          onPressed: () {
            Favoritos.instance.alternar(conteudo.id);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(
                    adicionado
                        ? '"${conteudo.titulo}" removido da minha lista'
                        : '"${conteudo.titulo}" adicionado à minha lista',
                  ),
                ),
              );
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          child: Icon(
            adicionado ? Icons.check_rounded : Icons.add_rounded,
            size: 22,
          ),
        );
      },
    );
  }
}

class _Classificacao extends StatelessWidget {
  const _Classificacao({required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textSecondary),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

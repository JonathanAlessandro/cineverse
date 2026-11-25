import 'package:cineverse/data/catalogo.dart';
import 'package:cineverse/data/favoritos.dart';
import 'package:cineverse/model/conteudo.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:cineverse/widgets/capa_imagem.dart';
import 'package:cineverse/widgets/carrossel_titulos.dart';
import 'package:flutter/material.dart';

/// TELA 3 - Detalhes do conteúdo.
///
/// Mostra imagem de destaque, informações do título, sinopse e as ações
/// "Assistir" e "Adicionar à minha lista", além do retorno à tela anterior.
class DetalhesScreen extends StatelessWidget {
  const DetalhesScreen({super.key, required this.conteudo});

  final Conteudo conteudo;

  @override
  Widget build(BuildContext context) {
    final semelhantes = Catalogo.recomendados
        .where((c) => c.id != conteudo.id)
        .toList();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.backgroundGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            tooltip: 'Voltar',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          actions: [
            _BotaoFavorito(conteudo: conteudo),
            const SizedBox(width: 4),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CapaDestaque(conteudo: conteudo),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conteudo.titulo,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _MetaLinha(conteudo: conteudo),
                    const SizedBox(height: 22),
                    _Acoes(conteudo: conteudo),
                    const SizedBox(height: 24),
                    const _Subtitulo('Sinopse'),
                    const SizedBox(height: 8),
                    Text(
                      conteudo.sinopse,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const _Subtitulo('Ficha técnica'),
                    const SizedBox(height: 12),
                    _Ficha(conteudo: conteudo),
                  ],
                ),
              ),
              if (semelhantes.isNotEmpty) ...[
                CarrosselTitulos(
                  titulo: 'Você também pode gostar',
                  itens: semelhantes,
                ),
              ],
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}

class _CapaDestaque extends StatelessWidget {
  const _CapaDestaque({required this.conteudo});

  final Conteudo conteudo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CapaImagem(url: conteudo.imagem, radius: 0),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x55000000),
                  Color(0x33000000),
                  AppColors.backgroundStart,
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
          const Center(
            child: _BotaoPlay(),
          ),
        ],
      ),
    );
  }
}

class _BotaoPlay extends StatelessWidget {
  const _BotaoPlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 74,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white70),
      ),
      child: const Icon(Icons.play_arrow_rounded, size: 42, color: Colors.white),
    );
  }
}

class _MetaLinha extends StatelessWidget {
  const _MetaLinha({required this.conteudo});

  final Conteudo conteudo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${conteudo.ano}',
          style: const TextStyle(fontSize: 13.5, color: AppColors.textSecondary),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textSecondary),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            conteudo.classificacao,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          conteudo.tipo,
          style: const TextStyle(fontSize: 13.5, color: AppColors.textSecondary),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.star_rounded, size: 16, color: AppColors.accent),
        const SizedBox(width: 3),
        Text(
          conteudo.nota.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _Acoes extends StatelessWidget {
  const _Acoes({required this.conteudo});

  final Conteudo conteudo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Reproduzindo "${conteudo.titulo}"...'),
                  ),
                );
            },
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Assistir'),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ListenableBuilder(
            listenable: Favoritos.instance,
            builder: (context, _) {
              final adicionado = Favoritos.instance.contem(conteudo.id);
              return OutlinedButton.icon(
                onPressed: () {
                  Favoritos.instance.alternar(conteudo.id);
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          adicionado
                              ? 'Removido de "Minha lista"'
                              : 'Adicionado à "Minha lista"',
                        ),
                      ),
                    );
                },
                icon: Icon(
                  adicionado ? Icons.check_rounded : Icons.add_rounded,
                ),
                label: Text(
                  adicionado ? 'Na minha lista' : 'Adicionar à minha lista',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BotaoFavorito extends StatelessWidget {
  const _BotaoFavorito({required this.conteudo});

  final Conteudo conteudo;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Favoritos.instance,
      builder: (context, _) {
        final adicionado = Favoritos.instance.contem(conteudo.id);
        return IconButton(
          tooltip: adicionado ? 'Remover da lista' : 'Adicionar à lista',
          onPressed: () => Favoritos.instance.alternar(conteudo.id),
          icon: Icon(
            adicionado
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: adicionado ? AppColors.secondary : Colors.white,
          ),
        );
      },
    );
  }
}

class _Subtitulo extends StatelessWidget {
  const _Subtitulo(this.texto);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }
}

class _Ficha extends StatelessWidget {
  const _Ficha({required this.conteudo});

  final Conteudo conteudo;

  @override
  Widget build(BuildContext context) {
    final linhas = <String, String>{
      'Gênero': conteudo.genero,
      'Ano de lançamento': conteudo.ano.toString(),
      'Classificação': '${conteudo.classificacao} anos',
      'Tipo': conteudo.tipo,
      'Categorias': conteudo.categorias.join(', '),
    };

    return Column(
      children: linhas.entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 130,
                    child: Text(
                      e.key,
                      style: const TextStyle(
                        fontSize: 13.5,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      e.value,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

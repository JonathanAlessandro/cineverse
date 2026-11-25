import 'package:cineverse/model/conteudo.dart';
import 'package:cineverse/widgets/poster_card.dart';
import 'package:cineverse/widgets/titulo_secao.dart';
import 'package:flutter/material.dart';

/// Seção com rolagem horizontal de títulos (usada na Home).
class CarrosselTitulos extends StatelessWidget {
  const CarrosselTitulos({
    super.key,
    required this.titulo,
    required this.itens,
    this.onVerTudo,
  });

  final String titulo;
  final List<Conteudo> itens;
  final VoidCallback? onVerTudo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TituloSecao(titulo: titulo, onVerTudo: onVerTudo),
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: itens.length,
            separatorBuilder: (_, _) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return PosterCard(conteudo: itens[index], largura: 138);
            },
          ),
        ),
      ],
    );
  }
}

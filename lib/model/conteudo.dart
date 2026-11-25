/// Representa um filme ou série do catálogo da plataforma.
class Conteudo {
  final String id;
  final String titulo;
  final int ano;
  final String genero;
  final String classificacao;
  final String sinopse;
  final double nota;
  final String tipo; // "Filme" ou "Série"
  final List<String> categorias;
  final String imagem;

  const Conteudo({
    required this.id,
    required this.titulo,
    required this.ano,
    required this.genero,
    required this.classificacao,
    required this.sinopse,
    required this.nota,
    required this.tipo,
    required this.categorias,
    required this.imagem,
  });
}

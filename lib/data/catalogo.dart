import 'package:cineverse/model/conteudo.dart';

/// Catálogo fictício da plataforma CineVerse.
///
/// As imagens são carregadas da internet (URLs determinísticas). Caso não
/// haja conexão, os cards exibem um placeholder com gradiente e o título.
class Catalogo {
  Catalogo._();

  static String _img(String seed) => 'https://picsum.photos/seed/$seed/400/600';

  static const String imagemBanner =
      'https://picsum.photos/seed/cineverse-banner/800/450';

  /// Categorias exibidas na tela Explorar.
  static const List<String> categorias = [
    'Ação',
    'Comédia',
    'Terror',
    'Drama',
    'Ficção',
    'Suspense',
    'Aventura',
  ];

  static final List<Conteudo> todos = [
    Conteudo(
      id: 'alem-do-horizonte',
      titulo: 'Além do Horizonte',
      ano: 2025,
      genero: 'Ficção Científica',
      classificacao: '14',
      sinopse:
          'Uma tripulação parte em missão para o limite do sistema solar e '
          'descobre que o maior desafio não está no espaço, mas em voltar para casa.',
      nota: 9.1,
      tipo: 'Série',
      categorias: ['Ficção', 'Aventura', 'Drama'],
      imagem: _img('alem-do-horizonte'),
    ),
    Conteudo(
      id: 'cidade-neon',
      titulo: 'Cidade Neon',
      ano: 2024,
      genero: 'Ação',
      classificacao: '16',
      sinopse:
          'Em uma metrópole movida por luzes e segredos, um detetive precisa '
          'desvendar uma conspiração que controla a cidade pelas sombras.',
      nota: 8.4,
      tipo: 'Filme',
      categorias: ['Ação', 'Suspense'],
      imagem: _img('cidade-neon'),
    ),
    Conteudo(
      id: 'o-ultimo-farol',
      titulo: 'O Último Farol',
      ano: 2023,
      genero: 'Drama',
      classificacao: '12',
      sinopse:
          'Um faroleiro solitário redescobre o valor da companhia quando uma '
          'tempestade traz um visitante inesperado à sua ilha.',
      nota: 7.8,
      tipo: 'Filme',
      categorias: ['Drama'],
      imagem: _img('o-ultimo-farol'),
    ),
    Conteudo(
      id: 'riso-solto',
      titulo: 'Riso Solto',
      ano: 2023,
      genero: 'Comédia',
      classificacao: 'L',
      sinopse:
          'Três amigos decidem abrir uma escola de comédia e transformam a '
          'vida do bairro inteiro em uma sequência de situações absurdas.',
      nota: 7.2,
      tipo: 'Filme',
      categorias: ['Comédia'],
      imagem: _img('riso-solto'),
    ),
    Conteudo(
      id: 'sombras-na-neblina',
      titulo: 'Sombras na Neblina',
      ano: 2024,
      genero: 'Terror',
      classificacao: '18',
      sinopse:
          'Moradores de uma vila isolada pela neblina começam a perceber que '
          'algo observa a cidade sempre que a noite cai.',
      nota: 8.0,
      tipo: 'Série',
      categorias: ['Terror', 'Suspense'],
      imagem: _img('sombras-na-neblina'),
    ),
    Conteudo(
      id: 'coracao-de-aco',
      titulo: 'Coração de Aço',
      ano: 2022,
      genero: 'Ação',
      classificacao: '14',
      sinopse:
          'Uma ex-piloto de resgate assume a missão mais difícil da carreira '
          'para salvar uma equipe presa em uma montanha.',
      nota: 7.5,
      tipo: 'Filme',
      categorias: ['Ação', 'Aventura'],
      imagem: _img('coracao-de-aco'),
    ),
    Conteudo(
      id: 'verao-em-marte',
      titulo: 'Verão em Marte',
      ano: 2025,
      genero: 'Aventura',
      classificacao: '10',
      sinopse:
          'Jovens colonos passam o primeiro verão em Marte e aprendem que '
          'construir um lar é mais difícil do que viajar até lá.',
      nota: 8.6,
      tipo: 'Série',
      categorias: ['Aventura', 'Ficção', 'Drama'],
      imagem: _img('verao-em-marte'),
    ),
    Conteudo(
      id: 'a-heranca',
      titulo: 'A Herança',
      ano: 2024,
      genero: 'Suspense',
      classificacao: '16',
      sinopse:
          'Ao herdar uma casa antiga, uma jovem descobre cartas que revelam '
          'um segredo de família guardado por décadas.',
      nota: 7.9,
      tipo: 'Filme',
      categorias: ['Suspense', 'Drama'],
      imagem: _img('a-heranca'),
    ),
    Conteudo(
      id: 'codigo-zero',
      titulo: 'Código Zero',
      ano: 2025,
      genero: 'Ficção Científica',
      classificacao: '14',
      sinopse:
          'Uma programadora encontra um arquivo impossível e precisa decidir '
          'se revela ao mundo a verdade sobre a inteligência artificial.',
      nota: 8.8,
      tipo: 'Filme',
      categorias: ['Ficção', 'Suspense'],
      imagem: _img('codigo-zero'),
    ),
    Conteudo(
      id: 'a-casa-do-lago',
      titulo: 'A Casa do Lago',
      ano: 2022,
      genero: 'Drama',
      classificacao: '12',
      sinopse:
          'Duas famílias dividem um verão à beira do lago e, sem perceber, '
          'mudam para sempre o destino uma da outra.',
      nota: 7.4,
      tipo: 'Série',
      categorias: ['Drama', 'Romance'],
      imagem: _img('a-casa-do-lago'),
    ),
    Conteudo(
      id: 'gargalhada-final',
      titulo: 'Gargalhada Final',
      ano: 2023,
      genero: 'Comédia',
      classificacao: '12',
      sinopse:
          'Um comediante decadente recebe a chance de um último show e '
          'precisa enfrentar o público mais difícil: a própria família.',
      nota: 7.1,
      tipo: 'Filme',
      categorias: ['Comédia', 'Drama'],
      imagem: _img('gargalhada-final'),
    ),
    Conteudo(
      id: 'o-silencio',
      titulo: 'O Silêncio',
      ano: 2025,
      genero: 'Terror',
      classificacao: '18',
      sinopse:
          'Quando o som desaparece de uma pequena cidade, seus habitantes '
          'descobrem que o silêncio pode ser a coisa mais assustadora.',
      nota: 8.2,
      tipo: 'Filme',
      categorias: ['Terror'],
      imagem: _img('o-silencio'),
    ),
  ];

  /// Conteúdo exibido no banner de destaque da Home.
  static Conteudo get destaque =>
      todos.firstWhere((c) => c.id == 'alem-do-horizonte');

  static List<Conteudo> get lancamentos =>
      todos.where((c) => c.ano >= 2025).toList();

  static List<Conteudo> get populares =>
      (todos.toList()..sort((a, b) => b.nota.compareTo(a.nota)))
          .take(6)
          .toList();

  static List<Conteudo> get recomendados => [
        todos.firstWhere((c) => c.id == 'a-heranca'),
        todos.firstWhere((c) => c.id == 'coracao-de-aco'),
        todos.firstWhere((c) => c.id == 'a-casa-do-lago'),
        todos.firstWhere((c) => c.id == 'riso-solto'),
        todos.firstWhere((c) => c.id == 'codigo-zero'),
      ];

  static List<Conteudo> porCategoria(String categoria) =>
      todos.where((c) => c.categorias.contains(categoria)).toList();

  static Conteudo porId(String id) => todos.firstWhere((c) => c.id == id);

  /// Favoritos pré-definidos exibidos em "Minha lista".
  static const List<String> favoritosIniciais = [
    'alem-do-horizonte',
    'cidade-neon',
    'a-casa-do-lago',
  ];
}

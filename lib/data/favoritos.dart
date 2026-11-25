import 'package:cineverse/data/catalogo.dart';
import 'package:flutter/foundation.dart';

/// Guarda os títulos adicionados em "Minha lista".
///
/// É um armazenamento simples e em memória (não persistente), suficiente para
/// a proposta do projeto. A tela "Minha lista" e o botão de detalhes escutam
/// este notificador para atualizar a interface automaticamente.
class Favoritos extends ChangeNotifier {
  Favoritos._();

  static final Favoritos instance = Favoritos._();

  final Set<String> _ids = {...Catalogo.favoritosIniciais};

  Set<String> get ids => _ids;

  bool contem(String id) => _ids.contains(id);

  void alternar(String id) {
    if (!_ids.remove(id)) {
      _ids.add(id);
    }
    notifyListeners();
  }

  List<String> get emOrdem => Catalogo.todos
      .where((c) => _ids.contains(c.id))
      .map((c) => c.id)
      .toList();
}

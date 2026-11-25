import 'package:cineverse/data/catalogo.dart';
import 'package:cineverse/model/conteudo.dart';
import 'package:cineverse/screens/detalhes_screen.dart';
import 'package:flutter/material.dart';

/// Abre a tela de detalhes de um [conteudo].
Future<void> abrirDetalhes(BuildContext context, Conteudo conteudo) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => DetalhesScreen(conteudo: conteudo)),
  );
}

/// Atalho para abrir os detalhes a partir de um id do catálogo.
Future<void> abrirDetalhesPorId(BuildContext context, String id) {
  return abrirDetalhes(context, Catalogo.porId(id));
}

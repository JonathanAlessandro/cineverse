import 'package:cineverse/data/catalogo.dart';
import 'package:cineverse/widgets/banner_destaque.dart';
import 'package:cineverse/widgets/carrossel_titulos.dart';
import 'package:cineverse/widgets/logo_app.dart';
import 'package:flutter/material.dart';

/// TELA 1 - Página inicial (Home).
///
/// Apresenta o logotipo, o banner de destaque e as seções de lançamentos,
/// filmes populares e conteúdos recomendados.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const LogoApp(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFF3A2A6B),
              child: Icon(Icons.person_rounded, size: 18, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerDestaque(conteudo: Catalogo.destaque),
            CarrosselTitulos(
              titulo: 'Lançamentos',
              itens: Catalogo.lancamentos,
            ),
            CarrosselTitulos(
              titulo: 'Filmes populares',
              itens: Catalogo.populares,
            ),
            CarrosselTitulos(
              titulo: 'Recomendados para você',
              itens: Catalogo.recomendados,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

import 'package:cineverse/screens/explorar_screen.dart';
import 'package:cineverse/screens/home_screen.dart';
import 'package:cineverse/screens/minha_lista_screen.dart';
import 'package:cineverse/screens/pesquisa_screen.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:cineverse/widgets/gradient_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CineVerseApp());
}

class CineVerseApp extends StatelessWidget {
  const CineVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineVerse',
      theme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      home: const RootNav(),
    );
  }
}

/// Estrutura principal: mantém as quatro seções principais e o menu de
/// navegação inferior. A tela de detalhes é aberta por cima via Navigator.
class RootNav extends StatefulWidget {
  const RootNav({super.key});

  @override
  State<RootNav> createState() => _RootNavState();
}

class _RootNavState extends State<RootNav> {
  int _index = 0;

  static const List<Widget> _telas = [
    HomeScreen(),
    ExplorarScreen(),
    PesquisaScreen(),
    MinhaListaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: IndexedStack(index: _index, children: _telas),
      bottomNavigationBar: _MenuInferior(
        index: _index,
        onChanged: (i) => setState(() => _index = i),
      ),
    );
  }
}

class _MenuInferior extends StatelessWidget {
  const _MenuInferior({required this.index, required this.onChanged});

  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.cardBorder)),
      ),
      child: SafeArea(
        top: false,
        child: NavigationBar(
          height: 66,
          elevation: 0,
          backgroundColor: Colors.transparent,
          indicatorColor: AppColors.primary.withValues(alpha: 0.28),
          selectedIndex: index,
          onDestinationSelected: onChanged,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Início',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore_rounded),
              label: 'Explorar',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search_rounded),
              label: 'Pesquisa',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_border_rounded),
              selectedIcon: Icon(Icons.bookmark_rounded),
              label: 'Minha lista',
            ),
          ],
        ),
      ),
    );
  }
}

// Teste de fumaça (smoke test) da plataforma CineVerse.
//
// Verifica se a Home é montada e exibe o logotipo e a seção de lançamentos.

import 'package:cineverse/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home exibe o logotipo e a seção de lançamentos', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CineVerseApp());
    await tester.pump();

    expect(find.text('CineVerse'), findsOneWidget);
    expect(find.text('Lançamentos'), findsOneWidget);
  });
}

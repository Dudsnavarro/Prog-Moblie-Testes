import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../lib/main.dart';

void main() {
  testWidgets('Deve exibir os itens de leilão na tela', (WidgetTester tester) async {
    await tester.pumpWidget(AuctionApp());

    // Valida que o título dos itens aparece na interface
    expect(find.text('Antique Vase'), findsOneWidget);
    expect(find.text('Vintage Watch'), findsOneWidget);
    expect(find.text('Luxury Car'), findsOneWidget);
  });
}
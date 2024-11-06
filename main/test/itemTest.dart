import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/auction_item.dart';

void main() {
  test('Deve criar um item de leilão com os atributos corretos', () {
    final item = AuctionItem(name: 'Antique Vase', category: 'Antique', price: 150.0);
    expect(item.name, 'Antique Vase');
    expect(item.category, 'Antique');
    expect(item.price, 150.0);
  });

  test('Deve retornar a categoria correta de um item', () {
    final item = AuctionItem(name: 'Luxury Car', category: 'Vehicle', price: 50000.0);
    expect(item.category, 'Vehicle');
  });
}
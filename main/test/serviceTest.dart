import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../lib/services/auction_service.dart';
import '../../lib/models/auction_item.dart';

class MockClient extends Mock implements http.Client {}

@GenerateMocks([MockClient])
void main() {
  test('Deve filtrar os itens pela categoria Antique', () async {
    final client = MockClient();
    final service = AuctionService();

    when(client.get(Uri.parse(service.apiUrl)))
        .thenAnswer((_) async => http.Response(
            '[{"name": "Antique Vase", "category": "Antique", "price": 150.0}]',
            200));

    final response = await client.get(Uri.parse(service.apiUrl));
    final List<dynamic> data = jsonDecode(response.body);
    final items = data.map((item) => AuctionItem.fromJson(item)).toList();

    expect(response.statusCode, 200);
    expect(items.isNotEmpty, true);
    expect(items.first.category, 'Antique');
  });
}
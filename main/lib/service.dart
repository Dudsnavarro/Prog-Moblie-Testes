import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auction_item.dart';

class AuctionService {
  final String apiUrl = 'https://api.example.com/auction/items';

  Future<List<AuctionItem>> fetchAuctionItems() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => AuctionItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load auction items');
    }
  }
}

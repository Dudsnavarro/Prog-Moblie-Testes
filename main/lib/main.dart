import 'package:flutter/material.dart';
import 'models/auction_item.dart';
import 'services/auction_service.dart';

void main() => runApp(AuctionApp());

class AuctionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuctionHomePage(),
    );
  }
}

class AuctionHomePage extends StatefulWidget {
  @override
  _AuctionHomePageState createState() => _AuctionHomePageState();
}

class _AuctionHomePageState extends State<AuctionHomePage> {
  final AuctionService auctionService = AuctionService();
  List<AuctionItem> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    try {
      final fetchedItems = await auctionService.fetchAuctionItems();
      setState(() {
        items = fetchedItems;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Failed to load items: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auction Items'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('${item.category} - \$${item.price}'),
                );
              },
            ),
    );
  }
}

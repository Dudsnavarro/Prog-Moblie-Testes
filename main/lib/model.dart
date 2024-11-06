class AuctionItem {
  final String name;
  final String category;
  final double price;

  AuctionItem({
    required this.name,
    required this.category,
    required this.price,
  });

  factory AuctionItem.fromJson(Map<String, dynamic> json) {
    return AuctionItem(
      name: json['name'],
      category: json['category'],
      price: json['price'],
    );
  }
}

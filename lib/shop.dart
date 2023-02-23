class Shop {
  final String name;
  final String image;  // Image.networkにnullは渡せないから?はダメ
  final double? rating;
  final String? genre;
  final String? station;
  final String? description;
  final String? url;

  Shop({
    required this.name,
    this.image = '',
    this.rating,  // 最初nullになる
    this.genre,
    this.station,
    this.description,
    this.url,
  });
}

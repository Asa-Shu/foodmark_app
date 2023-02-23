class Shop {
  final String name;
  final String image;
  double rating; // int型プロパティに初期値を設定しない場合0が設定される
  final String? genre;
  final String? station;
  final String? description;
  final String? url;

  Shop({
    required this.name,
    required this.image,
    this.rating = 0, // オプションパラメタ, 指定されない場合0を設定する
    this.genre,
    this.station,
    this.description,
    this.url,
  });
}

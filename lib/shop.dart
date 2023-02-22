class Shop {
  final String name;
  final String image;
  double rating; // int型プロパティに初期値を設定しない場合0が設定される

  Shop({
    required this.name, // 必須パラメタ
    required this.image, // 必須パラメタ
    this.rating = 0, // オプションパラメタ, 指定されない場合0を設定する
  });
}

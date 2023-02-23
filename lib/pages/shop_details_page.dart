import 'package:flutter/material.dart';
import '../shop.dart';

class ShopDetailsPage extends StatelessWidget {
  final Shop shop;

  // コンストラクタ
  const ShopDetailsPage(
      {Key? key /* オプション, keyはWidgetツリー内で一意の識別子を提供するために使用されます */,
      required this.shop /* 必須 */})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: Center(
        child: Text('Details about $shop.name'),
      ),
    );
  }
}

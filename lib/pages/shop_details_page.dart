import 'package:flutter/material.dart';

class ShopDetailsPage extends StatelessWidget {
  final String name;

  // コンストラクタ
  const ShopDetailsPage(
      {Key? key /* オプション, keyはWidgetツリー内で一意の識別子を提供するために使用されます */,
      required this.name /* 必須 */})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text('Details about $name'),
      ),
    );
  }
}

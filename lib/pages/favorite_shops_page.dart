import 'package:flutter/material.dart';
import 'shop_details_page.dart';
import '../shop.dart';
import 'add_shop_page.dart';

class FavoriteShopsPage extends StatefulWidget {
  // _FavoriteShopsPageStateクラスは、FavoriteShopsPageクラス内で宣言されており、FavoriteShopsPageクラスのメンバーとして定義されている
  @override
  _FavoriteShopsPageState createState() => _FavoriteShopsPageState();
}

class _FavoriteShopsPageState extends State<FavoriteShopsPage> {
  List<Shop> _favoriteShops = [
    Shop(
      name: 'Starbucks', // shop.nameでアクセス可能
      rating: 4.5,
      image: '',
    ),
    Shop(
      name: 'McDonald\'s',
      rating: 3.9,
      image: '',
    ),
    Shop(
      name: 'KFC',
      rating: 4.2,
      image: '',
    ),
  ];

  void _navigateToShopDetailsPage(Shop shop) {
    Navigator.push(
      context,
      // MaterialPageRouteクラスのbuilderプロパティには、遷移先のページのビルド方法を指定するコールバック関数が指定されています
      MaterialPageRoute(builder: (context) => ShopDetailsPage(name: shop.name)),
    );
  }

  void _navigateToAddShopPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddShopPage(onShopAdded: _addShop)),
    );
  }

  void _addShop(Shop shop) {
    setState(() {
      _favoriteShops.add(shop);
    });
  }

  void _deleteShop(int index) {
    setState(() {
      _favoriteShops.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Shops'),
      ),
      body: ListView.builder(
        itemCount: _favoriteShops.length,
        itemBuilder: (context, index) {
          final shop = _favoriteShops[index];
          return ListTile(
            leading: Image.network(
              shop.image,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset('images/hamburger.png');
              },
            ),
            title: Text(shop.name),
            subtitle: Text('★${shop.rating}'),
            onTap: () => _navigateToShopDetailsPage(shop),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteShop(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddShopPage,
        // Iconウィジェット, 引数に Icons クラスで定義されているアイコン名を指定する, ここではaddアイコンを利用
        child: Icon(Icons.add),
      ),
    );
  }
}

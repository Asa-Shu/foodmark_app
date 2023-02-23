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
      name: 'ファミリーマート',
      rating: 4.4,
      image:
          'https://joinus-terrace.com/img/joinusfmg/store/storage/w670xh670/cname_20181029135326.jpg',
      genre: 'コンビニ',
      station: '新宿',
      description: '美味しい食品がたくさんある',
      url: 'https://www.family.co.jp/',
    ),
    Shop(
      name: 'マクドナルド',
      rating: 3.0,
      image:
          'https://play-lh.googleusercontent.com/_GjSl-Pvj6nTpNMHOg-VJnLkVRJFzPFuKirDWcvSOBExGCSa4a1kZ5hxjwjRz2FtSS8t',
      genre: 'ファーストフード',
      station: '渋谷',
      description: 'ちょっと価格高くなってきてる',
      url: 'https://www.mcdonalds.co.jp/',
    )
  ];

  void _navigateToShopDetailsPage(Shop shop) {
    Navigator.push(
      context,
      // MaterialPageRouteクラスのbuilderプロパティには、遷移先のページのビルド方法を指定するコールバック関数が指定されています
      MaterialPageRoute(builder: (context) => ShopDetailsPage(shop: shop)),
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
            subtitle: Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 59, 59)),
                SizedBox(width: 5),
                Text('${shop.rating}', style: TextStyle(fontSize: 20)),
              ],
            ),
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
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../shop.dart';
// import 'package:url_launcher/url_launcher.dart';

class ShopDetailsPage extends StatelessWidget {
  final Shop shop;

  const ShopDetailsPage({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Image.network(
              shop.image,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset('images/hamburger.png');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shop.name,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.star, color: Color.fromARGB(255, 255, 59, 59)),
                    SizedBox(width: 4.0),
                    Text('${shop.rating}', style: TextStyle(fontSize: 18.0)),
                    SizedBox(width: 8.0),
                    Icon(Icons.category),
                    SizedBox(width: 4.0),
                    Text(shop.genre!, style: TextStyle(fontSize: 18.0)),
                    SizedBox(width: 8.0),
                    Icon(Icons.train),
                    SizedBox(width: 4.0),
                    Text(shop.station!, style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(shop.description!, style: TextStyle(fontSize: 18.0)),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () => {},
                  // launch(shop.url!),
                  child: Text(
                    'Visit website',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../shop.dart';

class AddShopPage extends StatefulWidget {
  final Function(Shop) onShopAdded;

  const AddShopPage({Key? key, required this.onShopAdded}) : super(key: key);

  @override
  _AddShopPageState createState() => _AddShopPageState();
}

class _AddShopPageState extends State<AddShopPage> {
  final _shopNameController = TextEditingController();
  final _shopImageController = TextEditingController();
  final _shopRatingController = TextEditingController();
  final _shopGenreController = TextEditingController();
  final _shopStationController = TextEditingController();
  final _shopDescriptionController = TextEditingController();
  final _shopURLController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _shopNameController.dispose();
    _shopImageController.dispose();
    _shopRatingController.dispose();
    _shopGenreController.dispose();
    _shopStationController.dispose();
    _shopDescriptionController.dispose();
    _shopURLController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _shopNameController,
                decoration: const InputDecoration(
                  labelText: '*Name',
                ),
                validator: (value) {
                  // value がnullでなく、かつ value が空文字列の場合
                  if (value!.isEmpty) {
                    return 'Please enter shop name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _shopImageController,
                decoration: const InputDecoration(
                  labelText: 'Image URL',
                ),
              ),
              TextFormField(
                controller: _shopRatingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Rating (enter a number)',
                ),
                validator: (value) {
                  if (value!.isNotEmpty) {
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _shopGenreController,
                decoration: const InputDecoration(
                  labelText: 'Genre',
                ),
              ),
              TextFormField(
                controller: _shopStationController,
                decoration: const InputDecoration(
                  labelText: 'Nearest Station',
                ),
              ),
              TextFormField(
                controller: _shopDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              TextFormField(
                controller: _shopURLController,
                decoration: const InputDecoration(
                  labelText: 'Shop URL',
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double? rating = _shopRatingController.text.isNotEmpty
                            ? double.parse(_shopRatingController.text)
                            : null;
                        final shop = Shop(
                          name: _shopNameController.text,
                          image: _shopImageController.text,
                          rating: rating,
                          genre: _shopGenreController.text,
                          station: _shopStationController.text,
                          description: _shopDescriptionController.text,
                          url: _shopURLController.text,
                        );
                        widget.onShopAdded(shop);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

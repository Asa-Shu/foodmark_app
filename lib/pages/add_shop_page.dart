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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _shopNameController.dispose();
    _shopImageController.dispose();
    _shopRatingController.dispose();
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
                  labelText: 'Name',
                ),
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
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final shop = Shop(
                          name: _shopNameController.text,
                          image: _shopImageController.text,
                          rating: double.parse(_shopRatingController.text),
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

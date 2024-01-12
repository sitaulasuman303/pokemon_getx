import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_getx/home/mycontroller.dart';
import 'package:pokemon_getx/models/poke_model.dart';

class DetailsPage extends StatelessWidget {
  final ProductDataModel product;
  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    print(product.type);
    String types = product.type.map((item) => '$item ').join(', ');
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Poke Details")),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            product.name,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Id: ${product.id}',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Type: $types',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 209, 244, 227),
                image: DecorationImage(image: NetworkImage(product.imageUrl))),
          ),
          const Spacer(
            flex: 2,
          ),
          ElevatedButton(
              onPressed: () {
                var myController = Get.find<MyController>();
                myController.addToFav(product);
                Get.snackbar("Added to Favourites",
                    '${product.name} added to favourites');
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary),
              child: const Text(
                'Add to favourites',
                style: TextStyle(color: Colors.black),
              )),
          const SizedBox(
            height: 25,
          )
        ],
      )),
    );
  }
}

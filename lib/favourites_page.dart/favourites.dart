import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_getx/home/mycontroller.dart';
import 'package:pokemon_getx/home/poke_list.dart';

class FavouratePokemons extends StatelessWidget {
  const FavouratePokemons({super.key});

  @override
  Widget build(BuildContext context) {
    var myController = Get.find<MyController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favourite Pokemons"),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border_sharp))
          ],
        ),
        body: Obx(() {
          return ListView.builder(
              itemCount: myController.favData.length,
              itemBuilder: (context, index) {
                return ProductList(product: myController.favData[index]);
              });
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_getx/details_page/detailsPage.dart';
import 'package:pokemon_getx/favourites_page.dart/favourites.dart';
import 'package:pokemon_getx/home/mycontroller.dart';
import 'package:pokemon_getx/home/poke_list.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  var myController = Get.put(MyController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("getX POkeApp"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const FavouratePokemons());
                },
                icon: const Icon(Icons.favorite_border_sharp))
          ],
        ),
        body: Obx(() {
          if (myController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: myController.pokeData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailsPage(
                            product: myController.pokeData[index],
                          ));
                    },
                    child: ProductList(product: myController.pokeData[index]));
              });
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_getx/home/mycontroller.dart';
import 'package:pokemon_getx/home/poke_list.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  var myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("getX POkeApp"),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border_sharp))
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
                return ProductList(product: myController.pokeData[index]);
              });
        }));
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_getx/home/mycontroller.dart';
import 'package:pokemon_getx/models/poke_model.dart';

class ProductList extends StatelessWidget {
  final ProductDataModel product;
  const ProductList({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                image: DecorationImage(image: NetworkImage(product.imageUrl))),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(product.description),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product.price}"),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        var myController = Get.find<MyController>();
                      },
                      icon: const Icon(Icons.favorite_border)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

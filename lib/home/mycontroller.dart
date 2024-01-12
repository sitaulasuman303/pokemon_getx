import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_getx/models/poke_model.dart';

class MyController extends GetxController {
  List pokeData = <ProductDataModel>[].obs;
  List favData = <ProductDataModel>[].obs;
  List filteredPokeData = <ProductDataModel>[].obs;
  var isLoading = true.obs;
  fetchData() async {
    try {
      isLoading(true);
      var url =
          "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
      var data;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        data = json.decode(jsonString);
        print(data['pokemon'][0]);
      }
      if (data != null && data['pokemon'] is List) {
        final List<dynamic> pokeList = data['pokemon'];
        final List<ProductDataModel> products = pokeList.map((item) {
          return ProductDataModel(
              id: item['id'],
              name: item['name'],
              description: item['name'],
              price: double.tryParse(item['spawn_chance'].toString()) ?? 0.0,
              imageUrl: item['img'],
              type: item['type']);
        }).toList();
        pokeData.addAll(products);
        filteredPokeData.addAll(products);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void addToFav(ProductDataModel favProduct) {
    favData.add(favProduct);
  }

  void filterPokeData(String query) {
    filteredPokeData.assignAll(
      pokeData.where((pokemon) {
        return pokemon.name.toLowerCase().contains(query.toLowerCase());
      }).toList(),
    );
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}

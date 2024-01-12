class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List type;

  ProductDataModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.type,
      required this.imageUrl});
}

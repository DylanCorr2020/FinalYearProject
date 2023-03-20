class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const CATEGORY = "category";
  static const DESCRIPTION = "description";
  static const PRICE = "price";

  late String id;
  late String image;
  late String name;
  late String category;
  late String description;
  late double price;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    category = data[CATEGORY];
    description = data[DESCRIPTION];
    //price = data[PRICE];
    price = double.tryParse(data[PRICE]) ?? 0.0;
  }
}

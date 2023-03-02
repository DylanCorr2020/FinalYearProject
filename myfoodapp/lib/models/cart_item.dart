class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const PRICE = "cost";

  late String id;
  late String image;
  late String name;
  late String quantity;
  late String cost;

  CartItemModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.cost});

  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    quantity = data[QUANTITY];
    cost = data[PRICE];
  }
}

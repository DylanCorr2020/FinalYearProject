class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const PRODUCT_ID = "productId";

  late String id;
  late String image;
  late String name;
  late int quantity;
  late double cost;
  late String productId;
  late double price;

  CartItemModel(
      {required this.productId,
      required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.cost});

  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    quantity = data[QUANTITY];
    cost = data[COST].toDouble();
    productId = data[PRODUCT_ID];

    //price = double.tryParse(data[PRICE]) ?? 0.0;
    //price = double.tryParse(data[PRICE]?.toString() ?? "0.0");
    price = double.tryParse(data[PRICE]?.toString() ?? "0.0") ?? 0.0;

    //price = data[PRICE].toDouble();
    //price = double.tryParse(data[PRICE]?.toString() ?? "0.0");

    //cost = data[COST].toDouble();
    //cost = data[COST] is num ? data[COST].toDouble() : 0.0;
    // 4th March 2023
    //This code below worked for most cases but not increment quanity
    // cost = double.tryParse(data[COST]) ?? 0.0;
    //cost = double.parse(data[COST]);

    // Issue 10
    //price = double.tryParse(data[PRICE]) ?? 0.0;
    //price = double.tryParse(data[PRICE]?.toString() ?? "0.0");
    //price = double.tryParse(data[PRICE]) ?? 0.0;
  }

  Map toJson() => {
        ID: id,
        PRODUCT_ID: productId,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        COST: price * quantity,
        PRICE: price
      };
}

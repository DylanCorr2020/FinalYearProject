class PaymentsModel {
  static const ID = "id";
  static const PAYMENT_ID = "paymentId";
  static const CART = "cart";
  static const AMOUNT = "amount";
  static const STATUS = "status";
  static const CREATED_AT = "dateCreated";

  late String id;
  late String paymentId;
  late String amount;
  late String status;
  late int dateCreated;
  late List cart;

  PaymentsModel(
      {required this.id,
      required this.paymentId,
      required this.amount,
      required this.status,
      required this.dateCreated,
      required this.cart});

  //named constructor to convert the data we get from firebase into payment model
  PaymentsModel.fromMap(Map data) {
    id = data[ID];
    dateCreated = data[CREATED_AT];
    paymentId = data[PAYMENT_ID];
    amount = data[AMOUNT];
    status = data[STATUS];
    cart = data[CART];
  }
}

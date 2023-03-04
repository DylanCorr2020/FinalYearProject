import 'package:get/get.dart';
import 'package:myfoodapp/cons/firebase.dart';
import 'package:myfoodapp/models/product.dart';

class ProductsController extends GetxController {
  static ProductsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";

  // populate the products as we open the app
  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }
// Listen to products on the database and automatically update if something changes

  Stream<List<ProductModel>> getAllProducts() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
}

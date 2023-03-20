import 'package:get/get.dart';
import 'package:myfoodapp/cons/firebase.dart';
import 'package:myfoodapp/models/product.dart';

class ProductsController extends GetxController {
  static ProductsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";

   RxList<String> categories = RxList<String>(['pizza', 'sides', 'desserts']);
   RxString selectedCategory = RxString('pizza');
  
  // populate the products as we open the app
  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
    ever(selectedCategory, (_) => getProductsByCategory(selectedCategory));
  }
// Listen to products on the database and automatically update if something changes

  Stream<List<ProductModel>> getAllProducts() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());

     // Function to filter products by category
  Stream<List<ProductModel>> getProductsByCategory(RxString category) =>
    
      firebaseFirestore
          .collection(collection)
          .where('category', isEqualTo: selectedCategory.value)
          .snapshots()
          .map((query) =>
              query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
    }



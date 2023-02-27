import 'package:swap_me/model/category_model.dart';
import 'package:swap_me/model/product_model.dart';

class ScreenArgs {
  ProductModel productModel;
  CategoryMainModel categoryMainModel;

  ScreenArgs({required this.productModel, required this.categoryMainModel});
}

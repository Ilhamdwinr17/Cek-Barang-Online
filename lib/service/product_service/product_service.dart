import 'package:dio/dio.dart';

class ProductService {
  getProducts() async {
    var response = await Dio().get(
      "https://capekngoding.com/demo/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }

  add(Map<String, Object> map) {}
}

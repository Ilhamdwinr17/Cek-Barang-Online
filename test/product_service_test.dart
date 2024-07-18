import 'package:flutter_test/flutter_test.dart';
import 'package:mvc_demo/service/product_service/product_service.dart';

void main() {
  group('ProductService', () {
    late ProductService productService;

    setUp(() {
      productService = ProductService();
    });

    test('getProducts return data', () async {
      // Act
      final result = await productService.getProducts();
      print(result);
      // Assert
      expect(result, isList);
    });

    test('addProduct test', () async {
      // Act
      await productService.add({
        "product_name": "GG FILTER 12",
        "price": 200,
        "desccription": "-",
      });
    });
  });
}

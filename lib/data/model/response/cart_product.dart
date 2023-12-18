import 'package:e_commerce/data/model/response/product_dm.dart';

class CartProduct {
  int? count;
  String? id;
  ProductDM? product;
  int? price;

  CartProduct({this.count, this.id, this.product, this.price});

  CartProduct.fromJson(dynamic json) {
    count = json["count"];
    id = json["_id"];
    product =
    json["product"] != null ? ProductDM.fromJson(json["product"]) : null;
    price = json["price"];
  }
}
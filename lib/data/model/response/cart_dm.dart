import 'package:e_commerce/data/model/response/cart_product.dart';

class CartDM {
  String? id;
  String? cartOwner;
  List<CartProduct>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  CartDM(
      {this.id,
        this.cartOwner,
        this.products,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.totalCartPrice});

  CartDM.fromJson(dynamic json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    if (json["products"] != null) {
      products = [];
      json["products"].forEach((v) {
        products?.add(CartProduct.fromJson(v));
      });
    }
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }
}
import 'package:e_commerce/data/model/response/categories_dm.dart';

class ProductDM {
  int? sold;
  List<String>? images;
  List<CategoryDM>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryDM? category;
  CategoryDM? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductDM({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  ProductDM.fromJson(dynamic json) {
    sold = json["sold"];
    images = json["images"] != null ? json["images"].cast<String>() : [];
    if (json["subcategory"] != null) {
      subcategory = [];
      json["subcategory"].forEach((v) {
        subcategory?.add(CategoryDM.fromJson(v));
      });
    }
    ratingsQuantity = json["ratingsQuantity"];
    id = json["_id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
    category =
    json["category"] != null ? CategoryDM.fromJson(json["category"]) : null;
    brand = json["brand"] != null ? CategoryDM.fromJson(json["brand"]) : null;
    ratingsAverage = json["ratingsAverage"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }
}
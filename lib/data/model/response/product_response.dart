import 'package:e_commerce/data/model/response/base_response.dart';
import 'package:e_commerce/data/model/response/meta_data.dart';
import 'package:e_commerce/data/model/response/product_dm.dart';

class ProductsResponse extends BaseResponse {
  int? results;
  Metadata? metadata;
  List<ProductDM>? data;

  ProductsResponse({this.results, this.metadata, this.data});

  ProductsResponse.fromJson(dynamic json) {
    results = json["results"];
    message = json["message"];
    metadata =
    json["metadata"] != null ? Metadata.fromJson(json["metadata"]) : null;
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(ProductDM.fromJson(v));
      });
    }
  }
}
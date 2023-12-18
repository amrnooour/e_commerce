import 'package:e_commerce/data/model/response/base_response.dart';
import 'package:e_commerce/data/model/response/categories_dm.dart';
import 'package:e_commerce/data/model/response/meta_data.dart';

class CategoriesResponse extends BaseResponse {
  int? results;
  Metadata? metadata;
  List<CategoryDM>? data;

  CategoriesResponse({this.results, this.metadata, this.data});

  CategoriesResponse.fromJson(dynamic json) {
    results = json["results"];
    message = json["message"];
    metadata =
    json["metadata"] != null ? Metadata.fromJson(json["metadata"]) : null;
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(CategoryDM.fromJson(v));
      });
    }
  }
}
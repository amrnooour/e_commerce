import 'package:e_commerce/data/model/response/base_response.dart';

import 'cart_dm.dart';

class CartResponse extends BaseResponse {
  String? status;
  int? numOfCartItems;
  CartDM? data;

  CartResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["status"];
    numOfCartItems = json["numOfCartItems"];
    data = json["data"] != null ? CartDM.fromJson(json["data"]) : null;
  }
}
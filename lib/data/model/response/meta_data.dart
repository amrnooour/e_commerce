class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(dynamic json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
  }
}

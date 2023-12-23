class GalleryModel {
  int id;
  // int productsId;
  String url;

  GalleryModel({
    required this.id,
    // required this.productsId,
    required this.url,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['id'],
      // productsId: json['products_id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      // 'products_id': productsId,
      'url': url,
    };
  }
}

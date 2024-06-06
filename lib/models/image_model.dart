class ImageModel {
  final String id;
  final String url;
  final String category;

  ImageModel({required this.id, required this.url, required this.category});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      url: json['url'],
      category: json['category'],
    );
  }
}
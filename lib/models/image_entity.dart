class ImageEntity {
  final String title;
  final String description;
  final String url;

  ImageEntity(this.title, this.description, this.url);

  static ImageEntity fromJson(Map<String, dynamic> json) {
    return ImageEntity(
      json["data"][0]["title"],
      json["data"][0]["description"],
      json["links"][0]["href"],
    );
  }
}

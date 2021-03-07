class ImageEntity {
  final String title;
  final String description;
  final String image;


  ImageEntity(this.image, this.description, this.title);


  static ImageEntity fromJson(Map<String, dynamic>json){
    return ImageEntity(
      json["data"][0]["title"],
      json["data"][0]["description"],
      json["links"][0]["href"],
    );
  }
}
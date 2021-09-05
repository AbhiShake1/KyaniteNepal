class HomeImagesModel {
  static List<HomeImages>? images;
}

class HomeImages {
  final String shape, imageUrl, id;

  HomeImages({required this.shape, required this.imageUrl, required this.id});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "shape": shape,
      "imageUrl": imageUrl,
    };
  }

  factory HomeImages.fromMap(Map<String, dynamic> map) {
    return HomeImages(
      id: map["id"],
      shape: map["shape"],
      imageUrl: map["imageUrl"],
    );
  }
}

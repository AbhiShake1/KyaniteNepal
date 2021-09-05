class HomeImagesModel {
  static List<HomeItems>? images;
}

class HomeShapesModel {
  static List<HomeItems>? shapes;
}

class HomeItems {
  final String shape, imageUrl, id;

  HomeItems({required this.shape, required this.imageUrl, required this.id});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "shape": shape,
      "imageUrl": imageUrl,
    };
  }

  factory HomeItems.fromMap(Map<String, dynamic> map) {
    return HomeItems(
      id: map["id"],
      shape: map["shape"],
      imageUrl: map["imageUrl"],
    );
  }
}

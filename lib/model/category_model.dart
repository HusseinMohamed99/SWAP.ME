class CategoryMainModel {
  String name;
  String cId;
  String image;

  // final List<String> timeOfDay;
  // final List<String> images;

  CategoryMainModel({
    required this.cId,
    required this.name,
    required this.image,
    // required this.timeOfDay,
    // required this.images,
  });

  CategoryMainModel.fromFireStore(Map<String, dynamic> data)
      : this(
          cId: data['cId'],
          name: data['name'],
          image: data['image'],
          // timeOfDay: List.from(data['timeOfDay'],),
          // images: List.from(data['images'],),
        );

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'cId': cId,
      'image': image,
      // "timeOfDay": timeOfDay,
      // "images": images,
    };
  }
}

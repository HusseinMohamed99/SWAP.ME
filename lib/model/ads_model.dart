class AdsModel {
  String name;
  String iD;
  String? image;
  String desc;
  String categoryName;
  String productName;

  AdsModel({
    this.iD = '',
    required this.name,
    this.image,
    required this.desc,
    required this.categoryName,
    required this.productName,
  });

  AdsModel.fromFireStore(Map<String, dynamic> data)
      : this(
          iD: data['iD'],
          name: data['name'],
          image: data['image'],
          desc: data['desc'],
          categoryName: data['categoryName'],
          productName: data['productName'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'iD': iD,
      'image': image,
      'desc': desc,
      'categoryName': categoryName,
      'productName': productName,
    };
  }
}

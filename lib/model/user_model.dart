class UserModel {
  String email;
  String firstName;
  String lastName;
  String uId;
  String image;
  String phone;

  UserModel({
    this.uId = '',
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.phone,
  });

  UserModel.fromFireStore(Map<String, dynamic> data)
      : this(
    uId: data['uId'],
          email: data['email'],
          firstName: data['firstName'],
          lastName: data['lastName'],
          image: data['image'],
          phone: data['phone'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'uId': uId,
      'image': image,
      'phone': phone,
    };
  }
}

class ContactModel {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String website;
  final String address;

  final bool isFav;

  ContactModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.website,
    required this.address,
    this.isFav = false,
  });

  // factory ContactModel.fromJson (Map<String>, dynamic>json){
  //   return ContactModel(name: json['name'], email: json['email'], phoneNumber: json['phoneNumber'], website: json['website'], address: json['address']);
  // }
}

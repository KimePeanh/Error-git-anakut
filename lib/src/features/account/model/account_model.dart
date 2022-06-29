class AccountModel {
  final int id;
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? email;
  final String? gender;
  final String? date_of_birth;
  final String? qrcode;
  final String? image_url;
  final String? verified_status;

  factory AccountModel.fromjson(Map<String, dynamic> json) {
    return AccountModel(
      id: json["id"],
      firstname: json["first_name"],
      lastname: json["last_name"],
      phone: json["phone"],
      email: json["email"],
      gender: json["gender"],
      date_of_birth: json["date_of_birth"],
      qrcode: json["qrcode"],
      image_url: json['image_url'],
      verified_status: json['verified_status'],
    );
  }
  AccountModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.gender,
    required this.date_of_birth,
    required this.qrcode,
    required this.image_url,
    required this.verified_status,
  });
}

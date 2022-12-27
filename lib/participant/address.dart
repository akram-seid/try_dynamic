import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    required this.city,
    required this.postalCode,
    required this.province,
    required this.mailingAddress,
    required this.phoneNumber,
    required this.email,
    required this.id,
  });

  String city;
  String postalCode;
  String province;
  String mailingAddress;
  String phoneNumber;
  String email;
  int id;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    postalCode: json["postalCode"],
    province: json["province"],
    mailingAddress: json["mailingAddress"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "postalCode": postalCode,
    "province": province,
    "mailingAddress": mailingAddress,
    "phoneNumber": phoneNumber,
    "email": email,
    "id": id,
  };
}

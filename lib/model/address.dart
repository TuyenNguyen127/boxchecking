class Address {
  late String phoneNumber;
  late String name;
  late int? wardCodeId; // xa, phuong
  late int? districtId; // quan, huyen
  late int? cityId; // tinh, tpho
  late String address; // so nha
  Address({
    required this.phoneNumber,
    required this.name,
    required this.wardCodeId,
    required this.districtId,
    required this.cityId,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'name': name,
        'wardCode': wardCodeId,
        'districtId': districtId,
        'cityId': cityId,
        'address': address,
      };
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        phoneNumber: json["phoneNumber"] ?? '',
        name: json["name"] ?? '',
        wardCodeId: json["wardCode"] ?? '',
        districtId: json["districtId"] ?? '',
        cityId: json["cityId"] ?? '',
        address: json["address"] ?? '',
      );
}

class Address {
  late String name;
  late String phoneNumber;
  late String? date;
  late String address;
  late String? towardCode;
  // late int? districtId;
  late String? districtId;
  Address({
    required this.name,
    required this.phoneNumber,
    this.date,
    required this.address,
    this.towardCode,
    this.districtId,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'address': address,
        'date': date,
        'towardCode': towardCode,
        'districtId': districtId
      };
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json["name"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        address: json["address"] ?? '',
        date: json["date"] ?? '',
        towardCode: json["towardCode"] ?? '',
        districtId: json["districtId"] ?? '',
      );
}

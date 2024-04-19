class AddressModel {
  late String name; // ten user
  late String phoneNumber; // sdt
  late int wardCodeId; // xa, phuong
  late int districtId; // quan, huyen
  late int cityId; // tinh, tpho
  late String addressNumber; // so nha
  AddressModel({
    required this.name,
    required this.phoneNumber,
    required this.wardCodeId,
    required this.districtId,
    required this.cityId,
    required this.addressNumber,
  });

  // Map<String, dynamic> toJson() => {
  //       'phoneNumber': phoneNumber,
  //       'name': name,
  //       'wardCode': wardCodeId,
  //       'districtId': districtId,
  //       'cityId': cityId,
  //       'addressNumber': addressNumber,
  //     };
  // factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
  //       // addressId: json["addressId"] ?? '',
  //       phoneNumber: json["phoneNumber"] ?? '',
  //       name: json["name"] ?? '',
  //       wardCodeId: json["wardCode"] ?? '',
  //       districtId: json["districtId"] ?? '',
  //       cityId: json["cityId"] ?? '',
  //       addressNumber: json["address"] ?? '',
  //     );
}

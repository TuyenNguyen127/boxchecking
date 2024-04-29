class AddressModel {
  late String name; // tên user
  late String phoneNumber; // sđt
  late int wardCodeId; // xã, phường
  late int districtId; // quận, huyện
  late int cityId; // tỉnh, thành phố
  late String addressNumber; // số nhà, tên đường
  late String? addressFull;
  AddressModel(
    {
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

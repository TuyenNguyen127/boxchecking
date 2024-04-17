class RecivedItemModel {
  int id;
  String address;
  String dimension;
  String name;
  String phoneNumber;
  String note;
  String status;

  RecivedItemModel({
    required this.id,
    required this.address,
    required this.status,
    required this.dimension,
    required this.phoneNumber,
    required this.name,
    required this.note,
  });
}

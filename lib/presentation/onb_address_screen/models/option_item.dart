class MyDropListModel {
  MyDropListModel(this.listOptionItems);
  final List<MyOptionItem> listOptionItems;
}

class MyOptionItem {
  final String? id;
  final String name;

  MyOptionItem({this.id, required this.name});
}

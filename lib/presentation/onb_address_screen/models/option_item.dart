class MyDropListModel {
  MyDropListModel(this.listOptionItems);
  final List<MyOptionItem> listOptionItems;
}

class MyOptionItem {
  final int id;
  final String name;

  MyOptionItem({required this.id, required this.name});
}

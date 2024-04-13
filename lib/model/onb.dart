import '../core/app_export.dart';

class NewOrderBoxModel {
  NewOrderBoxModel({
    this.id,
    this.typebox,
    this.modelbox,
    this.service,
    this.amount
  }) {
    id = id ?? Rx(new DateTime.now().millisecondsSinceEpoch.toString());
    typebox = typebox ?? Rx("Carton box");
    modelbox = modelbox ?? Rx("50 x 50 x 50");
    service = service ?? Rx("Nothing");
    amount = amount ?? Rx(1);
  }

  Rx<String>? id;

  Rx<String>? typebox;

  Rx<String>? modelbox;

  Rx<String>? service;

  Rx<int>? amount;
}

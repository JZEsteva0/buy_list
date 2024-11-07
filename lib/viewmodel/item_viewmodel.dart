import 'package:get/get.dart';
import 'package:buy_list/database/db.dart';
import '../model/item.dart';

class ItemViewModel extends GetxController {
  var items = <Item>[].obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  void loadItems() async {
    final data = await _dbHelper.getItems();
    items.assignAll(data);
  }

void addItem(String name, String? description, int quantidade, String status) async {
  final item = Item(name: name, quantidade: quantidade, status: status);
  await _dbHelper.insertItem(item);
  loadItems();
}


  void updateItem(Item item) async {
    await _dbHelper.updateItem(item);
    loadItems();
  }

  void deleteItem(int id) async {
    await _dbHelper.deleteItem(id);
    loadItems();
  }
}
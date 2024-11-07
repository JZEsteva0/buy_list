class Item {
  int? id;
  String name;
  int quantidade;
  String status;

  Item({this.id, required this.name, required this. quantidade, required this.status});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantidade': quantidade,
      'description': status,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      quantidade: map['quantidade'],
      status: map['status'],
    );
  }
}
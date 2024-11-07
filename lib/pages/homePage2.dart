import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/item.dart';
import '../viewmodel/item_viewmodel.dart';

class HomePage extends StatelessWidget {
  final ItemViewModel viewModel = Get.put(ItemViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: viewModel.items.length,
          itemBuilder: (context, index) {
            final item = viewModel.items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.status ?? ''),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  viewModel.deleteItem(item.id!);
                },
              ),
              onTap: () {
                // Exemplo para editar um item
                showDialog(
                  context: context,
                  builder: (context) {
                    final nameController = TextEditingController(text: item.name);
                    final quantidadeController = TextEditingController(text: item.quantidade.toString()); // Convertendo para string
                    final statusController = TextEditingController(text: item.status);
                    return AlertDialog(
                      title: Text('Editar Item'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(labelText: 'Nome'),
                          ),
                          TextField(
                            controller: quantidadeController,
                            decoration: InputDecoration(labelText: 'Quantidade'),
                            keyboardType: TextInputType.number, // Forçar o teclado numérico
                          ),
                          TextField(
                            controller: statusController,
                            decoration: InputDecoration(labelText: 'Status'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            final quantidade = int.tryParse(quantidadeController.text) ?? 0; // Convertendo para int, com valor padrão 0 caso não seja válido
                            viewModel.updateItem(Item(
                              id: item.id,
                              name: nameController.text,
                              quantidade: quantidade,
                              status: statusController.text,
                            ));
                            Get.back();
                          },
                          child: Text('Salvar'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final nameController = TextEditingController();
              final quantidadeController = TextEditingController();
              final statusController = TextEditingController();
              return AlertDialog(
                title: Text('Adicionar Item'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Nome'),
                    ),
                    TextField(
                      controller: quantidadeController,
                      decoration: InputDecoration(labelText: 'Quantidade'),
                      keyboardType: TextInputType.number, // Forçar o teclado numérico
                    ),
                    TextField(
                      controller: statusController,
                      decoration: InputDecoration(labelText: 'Status'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      final quantidade = int.tryParse(quantidadeController.text) ?? 0;
                      viewModel.addItem(nameController.text, statusController.text, quantidade);
                      Get.back();
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

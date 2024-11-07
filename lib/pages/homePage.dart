import 'package:flutter/material.dart';
import 'package:buy_list/pages/generate_pdf.dart';
import 'package:rive/rive.dart';

class HomePage extends StatelessWidget {  
  HomePage({super.key});

  final TextEditingController nameTextEditingController = TextEditingController();
  final TextEditingController senhaTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        title: Text('Lista de compras'),
        actions: [
          IconButton(
            onPressed: () {
              GeneratePrinting().PrintingPdf(
                nameTextEditingController.text,
                senhaTextEditingController.text,
                emailTextEditingController.text,
                      );
            },
            icon: Icon(
              color: Color.fromARGB(255, 252, 210, 3),
              Icons.picture_as_pdf,
            ),
       ),],
      ),
      
      body: Row(
        children: [
          Expanded(
            flex: 1, // Ocupa metade da largura da tela
            child: RiveAnimation.asset('assets/animations/arcane.riv'),
          ),
          Expanded(
            flex: 1, // Ocupa a outra metade da largura da tela
            child: Center( // Centraliza o Column no lado direito
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
                children: [
                  // Row para os botões
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Centraliza os botões
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: Text('Google'),
                        icon: Icon(Icons.login),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.yellow)
                        ),

                      SizedBox(width: 16), // Espaçamento entre os botões

                      ElevatedButton.icon(
                          onPressed: () {},
                          label: Text('Facebook'),
                          icon: Icon(Icons.facebook),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.yellow)
                      ),
                    ],
                  ),
                  SizedBox(height: 32), // Espaçamento abaixo dos botões
                  TextFormField(
                    controller: nameTextEditingController,
                    decoration: InputDecoration(
                      labelText: 'Nome Completo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: senhaTextEditingController,
                    decoration: InputDecoration(
                      labelText: 'CPF',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: emailTextEditingController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
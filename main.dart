import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  Widget _resultado = Icons.calculate as Widget;

  void _limparCampos() {
    _alturaController.text = "";
    _pesoController.text = "";
  }

  void _btnCalcularIMC() {
    //Obtem os valores de altura e peso a partir dos controllers
    //dos campos de texto:
    double alt = double.parse(_alturaController.text);
    double pes = double.parse(_pesoController.text);

    var meuImc = (pes / (alt * alt));

    //Realiza a nevegação para a próxima tela (resultado)
    //instanciando o widget IMCResultado e passando os parâmetros
    //necessários:
    setState(() {});
    _resultado = Text("$meuImc");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),

        // O widget SingleChildScrollView permite que o conteúdo da tela
        // seja rolado e impede que os demais componentes sejam cortados.
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Logotipo da Calculadora
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: _resultado),

                // Campo para a Altura
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Altura'),
                  ),
                ),

                // Campo para o peso
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Peso'),
                  ),
                ),

                // Botão para efetuar o cálculo
                ElevatedButton(
                  onPressed: _btnCalcularIMC,
                  child: const Text('Calcular IMC'),
                ),
              ],
            ),
          ),
        ));
  }
}

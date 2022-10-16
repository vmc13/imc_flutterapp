import 'package:flutter/material.dart';
import 'package:imc_flutterapp/main.dart';

class MyIMC extends StatefulWidget {
  const MyIMC({super.key});

  @override
  State<MyIMC> createState() => _MyIMCState();
}

class _MyIMCState extends State<MyIMC> {
  final TextEditingController _textEditingControllerPeso =
      TextEditingController();
  final TextEditingController _textEditingControllerAltura =
      TextEditingController();
  var calculo = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculadora IMC',
            style: TextStyle(
              color: Colors.purple,
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    _textEditingControllerPeso.clear();
                    _textEditingControllerAltura.clear();
                    imc = 'Informe seus dados!';
                  });
                },
                icon: Icon(Icons.refresh),
                color: Colors.purple,
                )
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 175,
                  child: Image.asset(
                    'images/icon_purple.png',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _textEditingControllerPeso,
                  autofocus: false,
                  style: TextStyle(color: Colors.purple),
                  decoration: InputDecoration(
                    label: Text('Insira o peso'),
                    hintText: 'Insira o peso',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _textEditingControllerAltura,
                  autofocus: false,
                  style: TextStyle(color: Colors.purple),
                  decoration: InputDecoration(
                    label: Text('Insira a altura'),
                    hintText: 'Insira a altura',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculo = double.parse(_textEditingControllerPeso.text) /
                          (double.parse(_textEditingControllerAltura.text) *
                              double.parse(_textEditingControllerAltura.text));
                      if (calculo < 18.6) {
                        imc = 'Abaixo do peso';
                      } else if (calculo == 18.6 || calculo <= 24.9) {
                        imc = 'Peso ideal';
                      } else if (calculo == 25 || calculo <= 29.9) {
                        imc = 'Levemente a cima do peso';
                      } else if (calculo == 30 || calculo <= 34.9) {
                        imc = 'Obesidade grau I';
                      } else if (calculo == 35 || calculo <= 39.9) {
                        imc = 'Obesidade grau II';
                      } else if (calculo >= 40) {
                        imc = 'Obesidade grau III';
                      } else {
                        imc = 'Insira valores válidos!';
                      }
                    });
                  },
                  child: Text('Calcular'),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(300, 48)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  imc,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.purple),
                )
              ],
            ),
          ),
        ));
  }
}

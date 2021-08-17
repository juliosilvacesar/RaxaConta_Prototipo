import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState(); //chama o metodo
}

class _HomePageState extends State<HomePage> {
  //cerebro da aplicação
  //Para calcular os dados iremos criar controllers.
  TextEditingController quantidadePessoasController = TextEditingController();
  TextEditingController valorContaController = TextEditingController();
  String _valorPessoa = "Informe seus dados";
  //metodo de calculo dos controllers
  void _calcular() {
    //no dart esse metodo significa privado
    //porem iremos converte os valores de String para double
    double quantidadePessoas = double.parse(quantidadePessoasController.text);
    double valorConta = double.parse(valorContaController.text);

    //condição de divisão
    double valorDividido = valorConta / quantidadePessoas;

    setState(() {
      //exige a informação assim que ocorre alteração no apk
      _valorPessoa =
          "Valor por pessoa: ${valorDividido.toStringAsPrecision(3)}"; //diminue as casas decimais
    }); // caso queiramos trabalhar com alteração de estados, utilizamos o setState
  }

  @override
  Widget build(BuildContext context) {
    // todos os componetens do flutter são Widget
    //aqui tudo ocorre.
    //determina a interface da nossa aplicação
    return Scaffold(
      appBar: AppBar(
        title: Text("Raxa Conta"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
          //Widget responsavel pela rolagem da tela
          child: Padding(
        //WidgetPadding
        padding: EdgeInsets.all(10),
        child: Form(
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //deixa o botão calcular do tamanho da tela - o padding
            children: <Widget>[
              Icon(Icons.monetization_on, size: 120, color: Colors.brown),
              TextFormField(
                //Widget Pessoa
                controller: quantidadePessoasController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Quantidade de pessoas",
                    labelStyle: TextStyle(color: Colors.brown)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown, fontSize: 18),
              ),
              TextFormField(
                //Widget Conta
                controller: valorContaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Valor da conta",
                    labelStyle: TextStyle(color: Colors.brown)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown, fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  height: 40,
                  child: RaisedButton(
                    // Widget Botão calcular
                    onPressed: () {
                      _calcular();
                    },
                    color: Colors.brown,
                    child: Text("Calcular",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
              Text(
                //Widget ValorPessoa
                _valorPessoa,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown, fontSize: 18),
              ),
            ],
          )),
        ),
      )),
    );
  }
}

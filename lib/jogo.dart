import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class jogo extends StatefulWidget {
  const jogo({Key? key}) : super(key: key);

  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var numero = Random().nextInt(3);


    switch (numero) {
      case 0:
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case 1:
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case 2:
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if (
    (escolhaUsuario == "pedra" && numero == 2) ||
        (escolhaUsuario == "papel" && numero == 0) ||
        (escolhaUsuario == "tesoura" && numero == 1)
    ) {
      setState(() {
        this._mensagem = "Você ganhou";
      });
    }
    else if (
    (escolhaUsuario == "pedra" && numero == 1) ||
        (escolhaUsuario == "papel" && numero == 2) ||
        (escolhaUsuario == "tesoura" && numero == 0)
    ) {
      setState(() {
        this._mensagem = "Você perdeu";
      });
    }
    else {
      setState(() {
        this._mensagem = "Empate";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(top:32, bottom:16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top:32, bottom:16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child:Image.asset("images/pedra.png", height: 100,)
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child:Image.asset("images/papel.png", height: 100,)
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child:Image.asset("images/tesoura.png", height: 100,)
              ),
              
            ],

          )
        ],
      ),
    );
  }
}

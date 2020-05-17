import 'package:flutter/material.dart';

class PedidoAceptadoScreen extends StatelessWidget {
  final int idReceta, idRestaurante, idChef;
  PedidoAceptadoScreen({this.idReceta, this.idRestaurante = -1, this.idChef = -1});
  @override
  Widget build(BuildContext context) {
    print(idReceta);
    print(idRestaurante);
    print(idChef);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FOODISM',
          style: TextStyle(
            fontFamily: "BalsamiqSans",
            color: Theme.of(context).accentColor,
            fontSize: 40,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Theme.of(context).accentColor),
      ),
      body: Column(children: <Widget>[
        
      ],),
    );
  }
}
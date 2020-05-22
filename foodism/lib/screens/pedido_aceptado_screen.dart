import 'package:flutter/material.dart';

class PedidoAceptadoScreen extends StatelessWidget {
  final int idReceta, idRestaurante, idChef;
  PedidoAceptadoScreen(
      {this.idReceta, this.idRestaurante = -1, this.idChef = -1});
  @override
  Widget build(BuildContext context) {
    print(idReceta);
    print(idRestaurante);
    print(idChef);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          Text('FOODISM', style: TextStyle(color: Theme.of(context).accentColor, fontSize: 50, fontFamily: 'BalsamiqSans'),),
          Icon(Icons.check, size: 200, color: Theme.of(context).primaryColor,),
          Text('¡Pedido en camino!', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, fontFamily: 'CeraPro'),),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Card(
                child: InkWell(
                  child: Center(
                    child: Text(
                      'Volver a inicio',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed("/");
                  },
                ),
                color: Color(0xAAF3B92F),
                elevation: 0,
                margin: new EdgeInsets.symmetric(horizontal: 20.0),
              ),
              height: 100,
          ),
          Spacer(),
        ],
      ),
    );
  }
}

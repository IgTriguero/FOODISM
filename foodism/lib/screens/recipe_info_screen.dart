import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:foodism/screens/pedido_aceptado_screen.dart';
import 'package:provider/provider.dart';

class RecipeInfoScreen extends StatelessWidget {
  final int idReceta, idRestaurante, idChef;
  RecipeInfoScreen({this.idReceta, this.idRestaurante = -1, this.idChef = -1});
  
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> receta = Provider.of<DataProvider>(context).getReceta(this.idReceta);
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
        Expanded(child: Text(receta['name']),),
        if (this.idRestaurante > -1 || this.idChef > -1) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 100,
              child: Card(
                child: InkWell(
                  child: Center(
                    child: Text(
                      'Pedir Receta',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PedidoAceptadoScreen(idReceta: this.idReceta, idChef: this.idChef, idRestaurante: this.idRestaurante,),
                    ),
                  ),
                ),
                color: Color(0xAAF3B92F),
                elevation: 0,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
      ],),
    );
  }
}
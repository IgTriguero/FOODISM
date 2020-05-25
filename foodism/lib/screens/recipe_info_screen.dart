import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:foodism/screens/pedido_aceptado_screen.dart';
import 'package:provider/provider.dart';

class RecipeInfoScreen extends StatelessWidget {
  final int idReceta, idRestaurante, idChef;
  RecipeInfoScreen({this.idReceta, this.idRestaurante = -1, this.idChef = -1});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> receta =
        Provider.of<DataProvider>(context, listen: false)
            .getReceta(this.idReceta);
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
      bottomNavigationBar: (this.idRestaurante > -1 || this.idChef > -1)
          ? Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
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
                        builder: (context) => PedidoAceptadoScreen(
                          idReceta: this.idReceta,
                          idChef: this.idChef,
                          idRestaurante: this.idRestaurante,
                        ),
                      ),
                    ),
                  ),
                  color: Color(0xAAF3B92F),
                  elevation: 0,
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                receta['name'],
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(receta['people'] + " personas"),
            ),
            ExpansionTile(
              title: Text(
                'Ingredientes',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              leading: Icon(
                Icons.local_pizza,
                color: Theme.of(context).primaryColor,
              ),
              children: <Widget>[
                for (var i = 0; i < receta['ingredients'].length; i++)
                  ListTile(
                    title: Text(
                      receta['ingredients'][i]['ingredient'],
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    trailing: Container(
                        width: 100,
                        child: Text(
                          receta['ingredients'][i]['cantidad'],
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                  ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Pasos',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              leading: Icon(
                Icons.format_list_numbered,
                color: Theme.of(context).primaryColor,
              ),
              children: <Widget>[
                for (var i = 0; i < receta['steps'].length; i++)
                  ListTile(
                    title: Text(
                      receta['steps'][i],
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    leading: Text(
                      "${i + 1}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
            ListTile(
              title: Text(
                "Notas",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(receta['notes']),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:foodism/screens/recipe_creation_screen.dart';
import 'package:foodism/screens/recipe_info_screen.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatelessWidget {
  static const routeName = '/recipes';
  final int idRestaurante, idChef;
  RecipesScreen({this.idChef = -1, this.idRestaurante = -1});
  int getIdRestaurante() {
    return idRestaurante;
  }

  int getIdChef() {
    return idChef;
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[
          if (this.idRestaurante > -1 || this.idChef > -1)
            Text(
              "Selecciona la receta que quieres pedir",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18),
            ),
          Expanded(
              child: _ListView(
            getIdChef: this.idChef,
            getIdRestaurante: this.idRestaurante,
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RecipeCreationScreen.routeName);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final int getIdRestaurante, getIdChef;
  _ListView({this.getIdRestaurante, this.getIdChef});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> recipes =
        Provider.of<DataProvider>(context).getRecipes();
    return recipes.length != 0
        ? ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(recipes[index]['name']),
                subtitle: Text("${recipes[index]['people']} personas"),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RecipeInfoScreen(
                      idReceta: recipes[index]['id'],
                      idChef: this.getIdChef,
                      idRestaurante: this.getIdRestaurante,
                    ),
                  ),
                ),
              ),
            ),
          )
        : Center(
            child: Text(
              'Añade una receta con el botón de abajo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
          );
  }
}

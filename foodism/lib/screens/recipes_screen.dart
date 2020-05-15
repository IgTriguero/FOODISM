import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:foodism/screens/recipe_creation_screen.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatelessWidget {
  static const routeName = '/recipes';

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
      body: _ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
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

class _ListView extends StatefulWidget {
  const _ListView({
    Key key,
  }) : super(key: key);

  @override
  __ListViewState createState() => __ListViewState();
}

class __ListViewState extends State<_ListView> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> recipes = Provider.of<DataProvider>(context, listen: false).getRecipes();
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(recipes[index]['name']),
          subtitle: Text("${recipes[index]['people']} personas"),
          onTap: () {
            
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:provider/provider.dart';

class RecipeCreationScreen extends StatefulWidget {
  static const routeName = '/recipecreation';

  @override
  _RecipeCreationScreenState createState() => _RecipeCreationScreenState();
}

class _RecipeCreationScreenState extends State<RecipeCreationScreen> {
  int currPage = 0;
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Circle(currPage >= 0),
              Circle(currPage >= 1),
              Circle(currPage >= 2),
              Circle(currPage >= 3),
              Circle(currPage >= 4),
              Circle(currPage >= 5),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currPage = value;
                });
              },
              children: <Widget>[
                Recipe1(),
                Recipe2(),
                Recipe3(),
                Recipe4(),
                Recipe5(),
                Recipe6(),
              ],
            ),
          ),
          Container(
            height: 60,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: InkWell(
                      child: Center(
                        child: Text(
                          'Atrás',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(
                          () {
                            if (currPage != 0) {
                              currPage--;
                              this.pageController.animateToPage(
                                    currPage,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.decelerate,
                                  );
                            }
                          },
                        );
                      },
                    ),
                    color: Color(0xAAF3B92F),
                    elevation: 0,
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(
                      child: Center(
                        child: Text(
                          'Siguiente',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (currPage != 5) {
                            currPage++;
                            this.pageController.animateToPage(currPage,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.decelerate);
                          }
                        });
                      },
                    ),
                    color: Color(0xAAF3B92F),
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final bool relleno;
  Circle([this.relleno = false]);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).accentColor),
        shape: BoxShape.circle,
        color: relleno ? Theme.of(context).accentColor : null,
      ),
    );
  }
}

class Recipe1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(),
          Text(
            'Nombre de la receta',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class Recipe2 extends StatefulWidget {
  @override
  _Recipe2State createState() => _Recipe2State();
}

class _Recipe2State extends State<Recipe2> {
  List<Map> _listaIngredientes = [];
  final _form = GlobalKey<FormState>();
  String _nombreIngrediente;
  String _cantidadIngrediente;

  void _submitItem() {
    final isValid = _form.currentState.validate();

    if (!isValid) return;

    _form.currentState.save();

    Map<String, dynamic> articulo = {
      'ingrediente': _nombreIngrediente,
      'cantidad': _cantidadIngrediente,
    };

    setState(() {
      _listaIngredientes.add(articulo);
    });

    _nombreIngrediente = null;
    _cantidadIngrediente = null;

    _form.currentState.reset();
  }

  void _removeItemButton(var item) {
    setState(() {
      _listaIngredientes.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _form,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ingrediente',
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) return 'Rellena este campo';
                      return null;
                    },
                    onSaved: (value) {
                      _nombreIngrediente = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cantidad',
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) return 'Rellena este campo';
                      return null;
                    },
                    onSaved: (value) {
                      _cantidadIngrediente = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        FlatButton(
          onPressed: _submitItem,
          child: Text(
            'Añadir ingrediente',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: _listaIngredientes
                .map(
                  (item) => ListTile(
                    key: ValueKey(item),
                    title: Text(
                      item['ingrediente'],
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            item['cantidad'],
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () => _removeItemButton(item),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class Recipe3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(),
          Text(
            'Número de personas de la receta',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class Recipe4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: null);
  }
}

class Recipe5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(),
          Text(
            'Notas',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class Recipe6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('6'),
    );
  }
}

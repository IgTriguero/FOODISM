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

  String nombre;
  List<Map> ingredientes;
  String people;
  List<String> pasos;
  String notas;

  _setNombre(String nombre) {
    this.nombre = nombre;
  }

  _setListaIngredientes(List<Map> ingredientes) {
    this.ingredientes = ingredientes;
  }

  _setPersonas(String personas) {
    print(personas);
    this.people = personas;
  }

  _setPasos(List<String> pasos) {
    this.pasos = pasos;
  }

  _setNotas(String notas) {
    this.notas = notas;
  }

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
                Recipe1(_setNombre),
                Recipe2(_setListaIngredientes),
                Recipe3(_setPersonas),
                Recipe4(_setPasos),
                Recipe5(_setNotas),
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
                          'Anterior',
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
                    color: this.currPage == 0
                        ? Color(0x33F3B92F)
                        : Color(0xAAF3B92F),
                    elevation: 0,
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(
                      child: Center(
                        child: Text(
                          this.currPage == 4 ? 'Finalizar' : 'Siguiente',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: this.currPage == 4
                          ? () {
                              if(this.nombre != null && this.pasos != [] && this.ingredientes != [] && this.notas != null && this.people != null){
                                print(this.people);
                                Provider.of<DataProvider>(context, listen: false)
                                  .addReceta(
                                      this.nombre,
                                      this.pasos,
                                      this.ingredientes,
                                      this.notas,
                                      this.people,
                                  );
                              Navigator.of(context).pop();}
                            }
                          : () {
                              setState(() {
                                if (currPage != 4) {
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
            height: 20,
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
    return AnimatedContainer(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).accentColor),
        shape: BoxShape.circle,
        color: relleno ? Theme.of(context).accentColor : null,
      ), duration: Duration(milliseconds: 300),
    );
  }
}

class Recipe1 extends StatelessWidget {
  final Function _setNombre;
  Recipe1([this._setNombre]);
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
            onChanged: (value) => _setNombre(value),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class Recipe2 extends StatefulWidget {
  final Function _setListaIngredientes;
  Recipe2([this._setListaIngredientes]);
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
      'ingredient': _nombreIngrediente,
      'cantidad': _cantidadIngrediente,
    };

    setState(() {
      _listaIngredientes.add(articulo);
    });

    _nombreIngrediente = null;
    _cantidadIngrediente = null;

    _form.currentState.reset();
    widget._setListaIngredientes(_listaIngredientes);
  }

  void _removeItemButton(var item) {
    setState(() {
      _listaIngredientes.remove(item);
    });
    widget._setListaIngredientes(_listaIngredientes);
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
                      item['ingredient'],
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FittedBox(
                            child: Text(
                              item['cantidad'],
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
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
  final Function _setPersonas;
  Recipe3([this._setPersonas]);

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
            onChanged: (value) => this._setPersonas(value),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class Recipe4 extends StatefulWidget {
  final Function _setPasos;
  Recipe4([this._setPasos]);
  @override
  _Recipe4State createState() => _Recipe4State();
}

class _Recipe4State extends State<Recipe4> {
  List<String> _listaPasos = [];
  final _form = GlobalKey<FormState>();
  String _descripcion;

  void _submitItem() {
    final isValid = _form.currentState.validate();

    if (!isValid) return;

    _form.currentState.save();

    setState(() {
      _listaPasos.add(_descripcion);
    });

    _descripcion = null;

    _form.currentState.reset();
    widget._setPasos(_listaPasos);
  }

  void _removeItemButton(var item) {
    setState(() {
      _listaPasos.remove(item);
    });
    widget._setPasos(_listaPasos);
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
                      labelText: 'Paso',
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    validator: (value) {
                      if (value.isEmpty) return 'Rellena este campo';
                      return null;
                    },
                    onSaved: (value) {
                      _descripcion = value;
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
            'Añadir paso',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: _listaPasos
                .map(
                  (item) => ListTile(
                    key: ValueKey(item),
                    title: Text(
                      item,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    trailing: Container(
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => _removeItemButton(item),
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

class Recipe5 extends StatelessWidget {
  final Function _setNotas;
  Recipe5([this._setNotas]);
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
            onChanged: (value) => this._setNotas(value),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

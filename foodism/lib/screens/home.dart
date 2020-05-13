import 'package:flutter/material.dart';
import 'package:foodism/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FOODISM',style: TextStyle(fontFamily: "BalsamiqSans",color: Theme.of(context).accentColor,fontSize: 40),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Theme.of(context).accentColor),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Card(
              child: InkWell(
                child: Center(
                  child: Text(
                    'Comida a domicilio',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
                onTap: () {
                  //Navigator.of(context).pushNamed(ListaCompraScreen.routeName);
                },
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Card(
              child: InkWell(
                child: Center(
                  child: Text(
                    'Chef a domicilio',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
                onTap: () {
                  //Navigator.of(context).pushNamed(ListadeListasScreen.routeName);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

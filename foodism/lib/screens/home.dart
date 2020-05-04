import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vengo del Super'),
      ),
      //drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Center(
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
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

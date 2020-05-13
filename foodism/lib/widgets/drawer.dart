import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
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
          iconTheme: new IconThemeData(color: Colors.transparent,)
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Información personal'),
          onTap: () {
            Navigator.of(context).pushNamed("/personal_info");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Métodos de pago'),
          onTap: () {
            Navigator.of(context).pushNamed("/pay_methods");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Ubicaciones'),
          onTap: () {
            Navigator.of(context).pushNamed("/locations");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Recetas'),
          onTap: () {
            Navigator.of(context).pushNamed("/recipes");
          },
        ),
        
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Cerrar sesion'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Ayuda'),
          onTap: () {
            Navigator.of(context).pushNamed("/help");
          },
        ),
      ]),
    );
  }
}

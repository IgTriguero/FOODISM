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
            iconTheme: new IconThemeData(
              color: Colors.transparent,
            )),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.person,
            color: Color(0xFF75440B),
          ),
          title: Text('Información personal', style: TextStyle(color: Color(0xFF75440B), fontSize: 18),),
          onTap: () {
            Navigator.of(context).pushNamed("/personal_info");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.payment,
            color: Color(0xFF75440B),
          ),
          title: Text('Métodos de pago', style: TextStyle(color: Color(0xFF75440B), fontSize: 18),),
          onTap: () {
            Navigator.of(context).pushNamed("/pay_methods");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.location_on,
            color: Color(0xFF75440B),
          ),
          title: Text('Ubicaciones', style: TextStyle(color: Color(0xFF75440B), fontSize: 18),),
          onTap: () {
            Navigator.of(context).pushNamed("/locations");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.book,
            color: Color(0xFF75440B),
          ),
          title: Text('Recetas', style: TextStyle(color: Color(0xFF75440B), fontSize: 18),),
          onTap: () {
            Navigator.of(context).pushNamed("/recipes");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Color(0xFF75440B),
          ),
          title: Text('Cerrar sesion', style: TextStyle(color: Color(0xFF75440B), fontSize: 18),),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.help,
            color: Color(0xFF75440B),
          ),
          title: Text('Ayuda', style: TextStyle(color: Color(0xFF75440B), fontSize: 18),),
          onTap: () {
            Navigator.of(context).pushNamed("/help");
          },
        ),
      ]),
    );
  }
}

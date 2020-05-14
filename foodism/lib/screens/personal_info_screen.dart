import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:provider/provider.dart';

class PersonalInfoScreen extends StatelessWidget {
  static const routeName = '/personal_info';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> user =
        Provider.of<DataProvider>(context).getCurrentUser();

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
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
            title: Text(user['name'], style: TextStyle(color: Theme.of(context).primaryColor)),
          ),
          ListTile(
            leading: Icon(Icons.email, color: Theme.of(context).primaryColor),
            title: Text(user['email'], style: TextStyle(color: Theme.of(context).primaryColor)),
          ),
          ListTile(
            leading:Icon(Icons.vpn_key, color: Theme.of(context).primaryColor),
            title: Text("Cambiar contraseña", style: TextStyle(color: Theme.of(context).primaryColor)),
          ),
          ListTile(
            leading:Icon(Icons.phone, color: Theme.of(context).primaryColor),
            title: Text(user['phone'], style: TextStyle(color: Theme.of(context).primaryColor)),
          ),
        ],
      ),
    );
  }
}

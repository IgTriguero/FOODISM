import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:provider/provider.dart';

class LocationsScreen extends StatelessWidget {
  static const routeName = '/locations';

Future<void> _showMyDialog(context) async {
  String _calle, _numero;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  decoration:
                      InputDecoration(labelText: "Calle", hintText: "C/ de la Hierbabuena"),
                  onChanged: (value) => _calle = value,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Numero", hintText: "nº78"),
                  onChanged: (value) => _numero = value,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Provider.of<DataProvider>(context, listen: false).addUbicacion(_calle, _numero);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
        child: _ListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> user =
        Provider.of<DataProvider>(context).getCurrentUser();
    List locations = user['locations'];
    return locations.length != 0
        ? ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(locations[index]['street']),
                subtitle: Text(locations[index]['number']),
                selected: locations[index]['selected'],
                trailing: Icon(
                  locations[index]['selected']
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: Theme.of(context).accentColor,
                ),
                onTap: () {
                    Provider.of<DataProvider>(context, listen: false)
                        .setSelectedLocation(index);
                },
              ),
            ),
          )
        : Center(
            child: Text(
              'Añade una dirección con el botón de abajo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
          );
  }
}

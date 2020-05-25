import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodism/Providers/data.dart';
import 'package:provider/provider.dart';

class PayMethodsScreen extends StatelessWidget {
  static const routeName = '/pay_methods';
  String _tarjeta, _mes, _ano;
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Añade tu tarjeta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  decoration:
                      InputDecoration(labelText: "Numero de la tarjeta", hintText: "1234 5678 1234 5678"),
                  onChanged: (value) => _tarjeta = value,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: "Mes", hintText: "11"),
                        onChanged: (value) => _mes = value,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: "Año", hintText: "23"),
                        onChanged: (value) => _ano = value,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Provider.of<DataProvider>(context, listen: false).addTarjeta(_tarjeta, _mes + "/" + _ano);
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
        onPressed: () => _showMyDialog(context),
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
    List cards = user['cards'];
    return cards.length != 0
        ? ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(cards[index]['number']),
                subtitle: Text(cards[index]['date']),
                selected: cards[index]['selected'],
                trailing: Icon(
                  cards[index]['selected']
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: Theme.of(context).accentColor,
                ),
                onTap: () {
                    Provider.of<DataProvider>(context, listen: false)
                        .setSelectedCard(index);
                },
              ),
            ),
          )
        : Center(
            child: Text(
              'Añade una tarjeta con el botón de abajo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:provider/provider.dart';

class PayMethodsScreen extends StatelessWidget {
  static const routeName = '/pay_methods';

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
        onPressed: null,
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
  int tarjeta = 0;

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
                  setState(() {
                    Provider.of<DataProvider>(context, listen: false)
                        .setSelectedCard(index);
                  });
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

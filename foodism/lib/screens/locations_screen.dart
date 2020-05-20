import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:provider/provider.dart';

class LocationsScreen extends StatelessWidget {
  static const routeName = '/locations';

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
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> user =
        Provider.of<DataProvider>(context, listen: false).getCurrentUser();
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
                  setState(() {
                    Provider.of<DataProvider>(context, listen: false)
                        .setSelectedLocation(index);
                  });
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

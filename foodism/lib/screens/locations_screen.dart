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
      body: _ListView()
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

    DataProvider data = Provider.of<DataProvider>(context, listen: false);
    print(data);
    List locations = data.users[data.usuarioActual]['locations'];
    print(locations);
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(locations[index]['street']),
            subtitle: Text(locations[index]['number']),
            selected: locations[index]['selected'],
            trailing: Icon(locations[index]['selected'] ? Icons.check_box: Icons.check_box_outline_blank, color: Colors.green,),
            onTap: () {
              setState(() {
                for(int i = 0; i < locations.length; i++){
                  if(i == index){
                    locations[i]['selected'] = true;
                    Provider.of<DataProvider>(context, listen: false).users[data.usuarioActual]['locations'][i]['selected'] = true;
                  } else {
                    locations[i]['selected'] = false;
                    Provider.of<DataProvider>(context, listen: false).users[data.usuarioActual]['locations'][i]['selected'] = false;
                  }
                }
              });
            },
          ),
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:foodism/screens/chef_info_screen.dart';
import 'package:provider/provider.dart';

class ChefsScreen extends StatelessWidget {
  static const routeName = '/chefs';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> chefs =
        Provider.of<DataProvider>(context).chefs;
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
      body:ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: chefs.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(chefs[index]['name']),
          subtitle: Text(chefs[index]['rating'] + "\n" + chefs[index]['tiempo']),
          isThreeLine: true,
          leading: Hero(
            tag: chefs[index]['img'],
            child: Image.network(
              chefs[index]['img'],
              height: double.infinity,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChefInfoScreen(index),
            ),
          ),
        ),
      ),
    );
  }
}
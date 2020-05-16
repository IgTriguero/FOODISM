import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:foodism/screens/restaurant_info_screen.dart';
import 'package:provider/provider.dart';

class RestaurantsScreen extends StatelessWidget {
  static const routeName = '/restaurants';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> restaurantes =
        Provider.of<DataProvider>(context).restaurants;

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
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: restaurantes.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(restaurantes[index]['name']),
          subtitle: Text(restaurantes[index]['rating'] + "\n" + restaurantes[index]['tiempo']),
          isThreeLine: true,
          leading: Hero(
            tag: restaurantes[index]['img'],
            child: Image.network(
              restaurantes[index]['img'],
              height: double.infinity,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RestaurantScreen(index),
            ),
          ),
        ),
      ),
    );
  }
}

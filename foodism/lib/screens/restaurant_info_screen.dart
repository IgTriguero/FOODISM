import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  static const routeName = '/restaurant';
  final int id;
  RestaurantScreen(this.id);
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> restaurante =
        Provider.of<DataProvider>(context).getRestaurante(this.id);
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
      body: Column(
        children: <Widget>[
          Hero(
            tag: restaurante['img'],
            child: Image.network(
              restaurante['img'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(restaurante['name']),
          Text(restaurante['slogan']),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(restaurante['rating']),
              Text(restaurante['tiempo'])
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                
                child: InkWell(
                  child: Center(
                    child: Text(
                      'Pedir Receta',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                color: Color(0xAAF3B92F),
                elevation: 0,
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}

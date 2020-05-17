import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:foodism/screens/recipes_screen.dart';
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
          SizedBox(
            height: 15,
          ),
          Text(
            restaurante['name'],
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            restaurante['slogan'],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                restaurante['rating'],
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
              Text(
                restaurante['tiempo'],
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              )
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 100,
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
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

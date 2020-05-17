import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:provider/provider.dart';

class ChefInfoScreen extends StatelessWidget {
  static const routeName = '/chef';
  final int id;
  ChefInfoScreen(this.id);
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> chef =
        Provider.of<DataProvider>(context).getChef(this.id);
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
            tag: chef['img'],
            child: Image.network(
              chef['img'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            chef['name'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                chef['rating'],
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
              Text(
                chef['tiempo'],
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

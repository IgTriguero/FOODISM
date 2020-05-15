import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:provider/provider.dart';

class RecipeCreationScreen extends StatefulWidget {
  static const routeName = '/recipecreation';

  @override
  _RecipeCreationScreenState createState() => _RecipeCreationScreenState();
}

class _RecipeCreationScreenState extends State<RecipeCreationScreen> {
  int currPage = 0;
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
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Circle(currPage >= 0),
              Circle(currPage >= 1),
              Circle(currPage >= 2),
              Circle(currPage >= 3),
              Circle(currPage >= 4),
              Circle(currPage >= 5),
            ],
          ),
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  currPage = value;
                });
              },
              children: <Widget>[
                Recipe1(),
                Recipe2(),
                Recipe3(),
                Recipe4(),
                Recipe5(),
                Recipe6(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final bool relleno;
  Circle([this.relleno = false]);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).accentColor),
        shape: BoxShape.circle,
        color: relleno ? Theme.of(context).accentColor : null,
      ),
    );
  }
}

class Recipe1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null
    );
  }
}

class Recipe2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null
    );
  }
}

class Recipe3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null
    );
  }
}

class Recipe4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null
    );
  }
}

class Recipe5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null
    );
  }
}

class Recipe6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('6'),
    );
  }
}

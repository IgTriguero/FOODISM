import 'package:flutter/material.dart';

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
  int tarjeta = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text("Tarjeta 1"),
            subtitle: Text("**** **** **** 1111"),
            selected: index == tarjeta ? true : false,
            trailing: Icon(index == tarjeta ? Icons.check_box: Icons.check_box_outline_blank, color: Colors.green,),
            onTap: () {
              setState(() {
                tarjeta = index;
              });
            },
          ),
        ),
    );
  }
}
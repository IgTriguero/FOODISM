import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  static const routeName = '/help';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Text(
              "Politicas",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                "Para proteger tus datos personales, Foodism toma todas las precauciones razonables y sigue las mejores prácticas de la industria para evitar su pérdida, mal uso, acceso indebido, divulgación, alteración o destrucción de los mismos. La seguridad de tus datos está garantizada, ya que toman todas las medidas de seguridad necesarias para ello. Puedes consultar su política de privacidad para tener más información."
                ,style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
            ),
          ],
        ),
      ),
    );
  }
}

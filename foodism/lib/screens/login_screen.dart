import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodism/services/auth.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Introduce un email correcto';
    else
      return null;
  }

  void _showDialog(String title, String body) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(body),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Center(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'FOODISM',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                            fontFamily: 'BalsamiqSans',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Correo'),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) => {_email = val},
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Email is Required';
                            }

                            return validateEmail(value);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Contraseña'),
                          onChanged: (val) => {setState(() => _password = val)},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Introduce una contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe tener 6 caracteres mínimo';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          color: Theme.of(context).accentColor,
                          onPressed: () async {
                            
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              'Inicia Sesión',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).canvasColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            color: Theme.of(context).primaryColor,
            child: InkWell(
              onTap: () => {
                },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '¿Aún no tienes cuenta? Regístrate',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
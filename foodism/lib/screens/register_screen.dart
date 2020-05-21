import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:foodism/screens/login_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email;
  String _password1;
  String _password2;
  String _nombre;
  String _telefono;

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
                              const InputDecoration(labelText: 'Nombre'),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) => {setState(() => _nombre = val)},
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'El nombre no puede estar vacío';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Telefono: +34678546372'),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) => {setState(() => _telefono = val)},
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'El nombre no puede estar vacío';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Correo'),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) => {setState(() => _email = val)},
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
                          onChanged: (val) =>
                              {setState(() => _password1 = val)},
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
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Repite la contraseña'),
                          onChanged: (val) =>
                              {setState(() => _password2 = val)},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Introduce una contraseña';
                            }
                            if (value != _password1) {
                              return 'Las contraseñas son diferentes';
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
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            Provider.of<DataProvider>(
                                    context,
                                    listen: false)
                                .register(
                                    _email, _password1, _nombre, _telefono);
                            
                              Navigator.of(context).pushReplacementNamed('/');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              'Regístrate',
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()))
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '¿Ya tienes cuenta? Inicia sesión',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodism/screens/home.dart';
import 'package:foodism/screens/login_screen.dart';
import 'package:foodism/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
      ],
      child: MaterialApp(
        title: 'FOODISM',
        theme: ThemeData(
            primaryColor: Color(0xFF75440B),
            accentColor: Color(0xFFF3B92F),
            canvasColor: Colors.grey[200],
            fontFamily: 'CeraPro'),
        home: LoginScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
        },
      ),
    );
  }
}

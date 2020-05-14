import 'package:flutter/material.dart';
import 'package:foodism/Providers/data.dart';
import 'package:foodism/screens/chef_info_screen.dart';
import 'package:foodism/screens/chefs_screen.dart';
import 'package:foodism/screens/help_screen.dart';
import 'package:foodism/screens/home.dart';
import 'package:foodism/screens/locations_screen.dart';
import 'package:foodism/screens/login_screen.dart';
import 'package:foodism/screens/pay_methods_screen.dart';
import 'package:foodism/screens/personal_info_screen.dart';
import 'package:foodism/screens/recipes_screen.dart';
import 'package:foodism/screens/register_screen.dart';
import 'package:foodism/screens/restaurant_info_screen.dart';
import 'package:foodism/screens/restaurants_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'FOODISM',
        theme: ThemeData(
          primaryColor: Color(0xFF75440B),
          accentColor: Color(0xFFF3B92F),
          canvasColor: Colors.grey[200],
          fontFamily: 'CeraPro',
        ),
        home: Selector<DataProvider, bool>(
          selector: (context, dataProvider) => dataProvider.logeado,
          builder: (context, logeado, child) => logeado ? HomeScreen() : LoginScreen(),
        ),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          ChefInfoScreen.routeName: (context) => ChefInfoScreen(),
          ChefsScreen.routeName: (context) => ChefsScreen(),
          HelpScreen.routeName: (context) => HelpScreen(),
          LocationsScreen.routeName: (context) => LocationsScreen(),
          PayMethodsScreen.routeName: (context) => PayMethodsScreen(),
          PersonalInfoScreen.routeName: (context) => PersonalInfoScreen(),
          RecipesScreen.routeName: (context) => RecipesScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          RestaurantScreen.routeName: (context) => RestaurantScreen(),
          RestaurantsScreen.routeName: (context) => RestaurantsScreen(),
        },
      ),
    );
  }
}

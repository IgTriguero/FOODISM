import 'dart:core';

import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  bool logeado = false;
  List<Map<String, dynamic>> users = [
    {
      'email': 'julian@correo.es',
      'password': 'julian',
      'name': 'Julian',
      'phone': '+34 678 908 645',
      'cards': [
        {'number': '**** **** **** 1234', 'date': '03/24', 'selected': true},
        {'number': '**** **** **** 6543', 'date': '11/24', 'selected': false}
      ],
      'locations': [
        {'street': 'C/ anadeasturias', 'number': '7', 'selected': true},
        {
          'street': 'C/ miraflores de la sierra',
          'number': '5',
          'selected': false
        }
      ],
      'recetas': [],
      'restaurantes': [1, 2]
    },
    {
      'email': 'ignacio@correo.es',
      'password': 'ignacio',
      'name': 'Ignacio',
      'phone': '+34 664 537 562',
      'cards': [
        {'number': '**** **** **** 5643', 'date': '03/22', 'selected': true},
        {'number': '**** **** **** 8762', 'date': '12/21', 'selected': false}
      ],
      'locations': [
        {
          'street': 'C/ de los Trescantadores',
          'number': '69',
          'selected': true
        },
        {'street': 'C/ keko', 'number': '5', 'selected': false}
      ],
      'recetas': [],
      'restaurantes': [3, 5]
    },
    {
      'email': 'miguel@correo.es',
      'password': 'miguel',
      'name': 'Migurl',
      'phone': '+34 605 275 437',
      'cards': [
        {'number': '**** **** **** 4321', 'date': '04/24', 'selected': true},
        {'number': '**** **** **** 5432', 'date': '04/23', 'selected': false}
      ],
      'locations': [
        {'street': 'C/ mekuen', 'number': '7', 'selected': true},
        {'street': 'C/ drinkresponsibly', 'number': '7', 'selected': false}
      ],
      'recetas': [],
      'restaurantes': [4, 3]
    }
  ];
  List<Map<String, dynamic>> restaurants = [
    {
      'id': 0,
      'name': 'McDonalds',
      'slogan': 'Donde tus caballos se convierten en comida',
      'rating': '80%',
      'tiempo': '12min'
    },
    {
      'id': 1,
      'name': 'El restaurante de tus pesadillas',
      'slogan': 'Donde ignacio trabaja',
      'rating': '0%',
      'tiempo': '1min'
    },
    {
      'id': 2,
      'name': 'KFC',
      'slogan': 'Kentucky Fried Children',
      'rating': '90%',
      'tiempo': '32min'
    },
    {
      'id': 3,
      'name': 'Burguer king',
      'slogan': 'Hamborguesas delisiosas',
      'rating': '68%',
      'tiempo': '19min'
    },
    {
      'id': 4,
      'name': 'Tierra Burrito',
      'slogan': 'Donde tus sueños se vuelven comida',
      'rating': '100%',
      'tiempo': '10min'
    }
  ];
  List<Map<String, dynamic>> chefs = [
    {
      'id': 0,
      'name': 'Rodolfo',
      'rating': '80%',
      'tiempo': '12min',
      'restaurante': 2
    },
    {
      'id': 1,
      'name': 'Ignacio',
      'rating': '0%',
      'tiempo': '18min',
      'restaurante': 1
    },
    {
      'id': 2,
      'name': 'Eustaquio',
      'rating': '90%',
      'tiempo': '17min',
      'restaurante': 3
    },
    {
      'id': 3,
      'name': 'Hermenegildo',
      'rating': '78%',
      'tiempo': '16min',
      'restaurante': 4
    },
    {
      'id': 4,
      'name': 'JulianPutoDios',
      'rating': '100%',
      'tiempo': '11min',
      'restaurante': 5
    }
  ];
  List<Map<String, dynamic>> recipes = [
    {
      'id': 0,
      'name': 'JulianPutoDios',
      'rating': '100%',
      'tiempo': '11min',
      'restaurante': 5
    }
  ];

  int usuarioActual;

  login(int index) {
    this.logeado = true;
    usuarioActual = index;
    this.notifyListeners();
  }

  logout() {
    this.logeado = false;
    usuarioActual = null;
    this.notifyListeners();
  }

  addReceta(String nombre, List<String> pasos,
      List<Map<String, dynamic>> ingredientes, String notas) {
    users[usuarioActual]['recetas'].add(recipes.length);
    recipes.add({
      'id': recipes.length,
      'name': nombre,
      'steps': pasos,
      'ingredients': ingredientes,
      'notes': notas
    });
  }

  addRestaurante(int id) {
    users[usuarioActual]['restaurantes'].add(id);
  }

  addTarjeta(String numero) {
    for (int i = 0; i < users[usuarioActual]['cards'].length; i++) {
      users[usuarioActual]['cards']['selected'] = false;
    }
    users[usuarioActual]['cards'].add({'number': numero, 'selected': true});
  }

  addUbicacion(String calle, String numero) {
    for (int i = 0; i < users[usuarioActual]['locations'].length; i++) {
      users[usuarioActual]['locations']['selected'] = false;
    }
    users[usuarioActual]['locations']
        .add({'street': calle, 'number': numero, 'selected': true});
  }

  getCurrentUser() {
    return users[usuarioActual];
  }

  setSelectedLocation(int index) {
    for (int i = 0; i < users[usuarioActual]['locations'].length; i++) {
      if (i == index) {
        users[usuarioActual]['locations'][i]['selected'] = true;
      } else {
        users[usuarioActual]['locations'][i]['selected'] = false;
      }
    }
  }
  setSelectedCard(int index) {
    for (int i = 0; i < users[usuarioActual]['cards'].length; i++) {
      if (i == index) {
        users[usuarioActual]['cards'][i]['selected'] = true;
      } else {
        users[usuarioActual]['cards'][i]['selected'] = false;
      }
    }
  }
}

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
      'recipes': [2,3],
      'restaurants': [1, 2]
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
      'recipes': [0,4],
      'restaurants': [3, 5]
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
      'recipes': [1,5],
      'restaurants': [4, 3]
    }
  ];
  List<Map<String, dynamic>> restaurants = [
    {
      'id': 0,
      'name': 'McDonalds',
      'slogan': 'Donde tus caballos se convierten en comida',
      'rating': '80%',
      'tiempo': '12min',
      'img': 'https://www.cinconoticias.com/wp-content/uploads/Mc-Donalds-flotante-abandonado.jpg'
    },
    {
      'id': 1,
      'name': 'El restaurante de tus pesadillas',
      'slogan': 'Donde ignacio trabaja',
      'rating': '0%',
      'tiempo': '1min',
      'img': 'https://breaking911.com/wp-content/uploads/2015/10/img_1640.jpg'
    },
    {
      'id': 2,
      'name': 'KFC',
      'slogan': 'Kentucky Fried Children',
      'rating': '90%',
      'tiempo': '32min',
      'img': 'https://media.fotki.com/2v2H3V71zx9eSoV.jpg'
    },
    {
      'id': 3,
      'name': 'Burguer king',
      'slogan': 'Hamborguesas delisiosas',
      'rating': '68%',
      'tiempo': '19min',
      'img': 'https://i.redd.it/vsx7o398ikq31.jpg'
    },
    {
      'id': 4,
      'name': 'Tierra Burrito',
      'slogan': 'Donde tus sueños se vuelven comida',
      'rating': '100%',
      'tiempo': '10min',
      'img': 'https://console.listae.com/files/2019/08/tierra_burrito_bar_serrano_madrid.jpg'
    }
  ];
  List<Map<String, dynamic>> chefs = [
    {
      'id': 0,
      'name': 'Rodolfo',
      'rating': '80%',
      'tiempo': '12min',
      'restaurante': 2,
      'img': 'https://media.istockphoto.com/photos/happy-chef-pointing-picture-id901093724'
    },
    {
      'id': 1,
      'name': 'Ignacio',
      'rating': '0%',
      'tiempo': '18min',
      'restaurante': 1,
      'img': 'https://images.megapixl.com/3001/30014151.jpg'
    },
    {
      'id': 2,
      'name': 'Eustaquio',
      'rating': '90%',
      'tiempo': '17min',
      'restaurante': 3,
      'img': 'https://thumbs.dreamstime.com/z/chef-35582114.jpg'
    },
    {
      'id': 3,
      'name': 'Hermenegildo',
      'rating': '78%',
      'tiempo': '16min',
      'restaurante': 4,
      'img': 'https://previews.123rf.com/images/alexraths/alexraths1201/alexraths120100010/12027059-chef-presenting-isolated-on-white-background.jpg'
    },
    {
      'id': 4,
      'name': 'JulianPutoDios',
      'rating': '100%',
      'tiempo': '11min',
      'restaurante': 5,
      'img': 'https://previews.123rf.com/images/ferrerivideo/ferrerivideo1309/ferrerivideo130900111/22274675-sexy-chef.jpg'
    }
  ];
  List<Map<String, dynamic>> recipes = [
    {
      'id': 0,
      'name': 'Cocretas',
      'steps': ['echar aceite', 'freirlas coño'],
      'ingredientss': [{'ingredient': 'aceite', 'cantidad': 'no se un chorrito como siempre'}, {'ingredient':'croquetas congeladas de la abuela', 'cantidad': 'las suficientes para alimentar a 4 personas mayores, aunque solo vayas a comer tu'}],
      'notes': 'si sobran te las comes, aqui no sobra nada',
      'people': '1'
    },
    {
      'id': 1,
      'name': 'Paella',
      'steps': ['echar pollo, pimiento y tomate en la paella', 'echar el arroz', 'echar un poco de agua'],
      'ingredientss': [{'ingredient': 'arroz', 'cantidad': '500 g'}, {'ingredient': 'pollo', 'cantidad': '100 g'}, {'ingredient': 'pimiento', 'cantidad': '100 g'}, {'ingredient': 'agua', 'cantidad': '100 cL'}],
      'notes': 'que quede un poco caldoso',
      'people': '2'
    },
    {
      'id': 2,
      'name': 'Ensalada Cesar',
      'steps': ['cortar el pollo', 'echar la ensalada', 'echar el pollo y el queso', 'echar la salsa cesar por encima', 'remover'],
      'ingredientss': [{'ingredient': 'lechuga', 'cantidad': '5 hojas'}, {'ingredient':'pollo', 'cantidad': '100 g'}, {'ingredient':'queso', 'cantidad': '100 g'}, {'ingredient':'salsa cesar', 'cantidad': '100 g'}],
      'notes': 'el queso tiene que ser rallado',
      'people': '1'
    },
    {
      'id': 3,
      'name': 'Sandiwch vegetal',
      'steps': ['tostar el pan', 'cortar lechuga, tomate y huevo', 'poner mayonesa en la base', 'poner atun, huevo, lechuda y tomate (por ese orden)'],
      'ingredientss': [{'ingredient': 'pan bimbo', 'cantidad': '80 panes'}, {'ingredient':'atun', 'cantidad': '5 kg'}, {'ingredient':'mayonesa', 'cantidad': '500 g'}, {'ingredient':'lechuga', 'cantidad': '30 hojas'}, {'ingredient':'tomate', 'cantidad': '20 piezas'}, {'ingredient':'huevo', 'cantidad': '20 piezas'}],
      'notes': 'hacer dos sandwiches por personas',
      'people': '20'
    },
    {
      'id': 4,
      'name': 'Crema de calabacin',
      'steps': ['cortar calabacin, patatas y puerro', 'meterlo en una olla a 90º'],
      'ingredientss': [{'ingredient': 'calabacin', 'cantidad': '100 g'}, {'ingredient':'patata', 'cantidad': '30 g'}, {'ingredient':'puerro', 'cantidad': '30 g'}],
      'notes': ' ',
      'people': '4'
    },
    {
      'id': 5,
      'name': 'Filetes de pollo',
      'steps': ['echar aceite', 'poner el filete dentro del aceite, no encima, dentro'],
      'ingredientss': [{'ingredient': 'aceite', 'cantidad': 'no se un chorrito como siempre'}, {'ingredient':'filetes previamente empanados', 'cantidad': 'un par o 6'}],
      'notes': 'El pollo tiene que estar muerto y fileteado, si no el proceso de empane puede ser complicado',
      'people': '1'
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
      List<Map> ingredientes, String notas, String people) {
    users[usuarioActual]['recipes'].add(recipes.length);
    int id = recipes.length;
    recipes.add({
      'id': id,
      'name': nombre,
      'steps': pasos,
      'ingredients': ingredientes,
      'notes': notas,
      'people': people
    });
    notifyListeners();
    print(this.recipes);
  }

  addRestaurante(int id) {
    users[usuarioActual]['restaurants'].add(id);
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
  List<Map<String, dynamic>> getRecipes(){
    List recetas = users[usuarioActual]['recipes'];
    List<Map<String, dynamic>> recetasRet = [];
    for (int i = 0; i < recetas.length; i++) {
      recetasRet.add(this.recipes[recetas[i]]);
    }
    return recetasRet;
  }
  Map<String, dynamic> getRestaurante(int id){
    return this.restaurants[id];
  }
  Map<String, dynamic> getChef(int id){
    return this.chefs[id];
  }
}

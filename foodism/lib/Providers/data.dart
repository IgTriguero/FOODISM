import 'dart:core';

import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  bool logeado = false;
  List<Map<String,dynamic>> users = [
    {'email': 'julian@correo.es', 'password':'julian', 'name':'Julian', 'cards':[{'number':'**** **** **** 1234', 'selected': true}], 'ubicaciones':[{'calle': 'C/ anadeasturias', 'numero': '7', 'selected': true}, {'calle': 'C/ miraflores de la sierra', 'numero': '5', 'selected': false}], 'recetas':[], 'restaurantes':[1, 2]},
    {'email': 'ignacio@correo.es', 'password':'ignacio', 'name':'Ignacio', 'cards':[{'number':'**** **** **** 5643', 'selected': true}], 'ubicaciones':[{'calle': 'C/ de los Trescantadores', 'numero': '69', 'selected': true}, {'calle': 'C/ keko', 'numero': '5', 'selected': false}], 'recetas':[], 'restaurantes':[3, 5]},
    {'email': 'miguel@correo.es', 'password':'miguel', 'name':'Migurl', 'cards':[{'number':'**** **** **** 4321', 'selected': true}], 'ubicaciones':[{'calle': 'C/ mekuen', 'numero': '7', 'selected': true}, {'calle': 'C/ drinkresponsibly', 'numero': '7', 'selected': false}], 'recetas':[], 'restaurantes':[4, 3]}
  ];
  List<Map<String,dynamic>> restaurantes = [
    {'id': 1, 'name': 'McDonalds', 'slogan': 'Donde tus caballos se convierten en comida', 'rating': '80%', 'tiempo': '12min'},
    {'id': 2, 'name': 'El restaurante de tus pesadillas', 'slogan': 'Donde ignacio trabaja', 'rating': '0%', 'tiempo': '1min'},
    {'id': 3, 'name': 'KFC', 'slogan': 'Kentucky Fried Children', 'rating': '90%', 'tiempo': '32min'},
    {'id': 4, 'name': 'Burguer king', 'slogan': 'Hamborguesas delisiosas', 'rating': '68%', 'tiempo': '19min'},
    {'id': 5, 'name': 'Tierra Burrito', 'slogan': 'Donde tus sueños se vuelven comida', 'rating': '100%', 'tiempo': '10min'}
  ];
  List<Map<String,dynamic>> chefs = [
    {'id': 1, 'name': 'Rodolfo',  'rating': '80%', 'tiempo': '12min', 'restaurante': 1},
    {'id': 2, 'name': 'Ignacio', 'rating': '0%', 'tiempo': '18min', 'restaurante': 2},
    {'id': 3, 'name': 'Eustaquio', 'rating': '90%', 'tiempo': '17min', 'restaurante': 3},
    {'id': 4, 'name': 'Hermenegildo', 'rating': '78%', 'tiempo': '16min', 'restaurante': 4},
    {'id': 5, 'name': 'JulianPutoDios', 'rating': '100%', 'tiempo': '11min', 'restaurante': 5}
  ];
  
  List<Map<String,dynamic>> recetas = [

  ];

  int usuarioActual;
  
  login(int index){
    this.logeado = true;
    usuarioActual = index;
    this.notifyListeners();
  }

  logout(){
    this.logeado = false;
    usuarioActual = null;
    this.notifyListeners();
  }
  addReceta(String nombre, List<String> pasos, List<Map<String, dynamic>> ingredientes){
    
  }
  addRestaurante(){

  }
  addTarjeta(){

  }
  addUbicacion(){

  }
}
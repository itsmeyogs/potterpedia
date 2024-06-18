import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:potterpedia/models/character.dart';
import 'package:potterpedia/models/spell.dart';

class PotterpediaApi{
  static Future<List<Character>> getAllCharacters() async{
    const baseUrl = 'https://hp-api.herokuapp.com/api/characters';
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      List<dynamic> data = jsonDecode(response.body);
      List<Character> characters = data.map((charactersData)=>Character.fromJson(charactersData)).toList();
      return characters;
    }else{
      if (kDebugMode) {
        print('Error: ${response.body}');
        print('Status Code: ${response.statusCode}');
      }
      throw Exception('Could not retrieve data from api');
    }
  }

  static Future<List<Spell>> getAllSpells() async{
    const baseUrl = 'https://hp-api.herokuapp.com/api/spells';
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      List<dynamic> data = jsonDecode(response.body);
      List<Spell> spells = data.map((spellsData)=>Spell.fromJson(spellsData)).toList();
      return spells;
    }
    else{
      if (kDebugMode) {
        print('Error: ${response.body}');
        print('Status Code: ${response.statusCode}');
      }
      throw Exception('Could not retrieve data from api');
    }
  }


  static Future<List<Character>> getHogwartsStudents() async{
    const baseUrl = 'https://hp-api.herokuapp.com/api/characters/students';
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      List<dynamic> data = jsonDecode(response.body);
      List<Character> students = data.map((studentsData)=>Character.fromJson(studentsData)).toList();
      return students;
    }else{
      if (kDebugMode) {
        print('Error: ${response.body}');
        print('Status Code: ${response.statusCode}');
      }
      throw Exception('Could not retrieve data from api');
    }
  }

  static Future<List<Character>> getHogwartsStaff() async{
    const baseUrl = 'https://hp-api.herokuapp.com/api/characters/staff';
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      List<dynamic> data = jsonDecode(response.body);
      List<Character> students = data.map((studentsData)=>Character.fromJson(studentsData)).toList();
      return students;
    }else{
      if (kDebugMode) {
        print('Error: ${response.body}');
        print('Status Code: ${response.statusCode}');
      }
      throw Exception('Could not retrieve data from api');
    }
  }

  static Future<List<Character>> getCharactersInAHome(String house) async{
    var baseUrl = 'https://hp-api.herokuapp.com/api/characters/house/$house';
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      List<dynamic> data = jsonDecode(response.body);
      List<Character> students = data.map((studentsData)=>Character.fromJson(studentsData)).toList();
      return students;
    }else{
      if (kDebugMode) {
        print('Error: ${response.body}');
        print('Status Code: ${response.statusCode}');
      }
      throw Exception('Could not retrieve data from api');
    }
  }
}
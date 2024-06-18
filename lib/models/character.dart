import 'package:potterpedia/models/wand.dart';

class Character {
  final String id;
  final String name;
  final List<String> alternateNames;
  final String species;
  final String gender;
  final String house;
  final String? dateOfBirth;
  final bool wizard;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final Wand wand;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final List<String> alternateActors;
  final bool alive;
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    this.dateOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternateActors,
    required this.alive,
    required this.image
  });

  factory Character.fromJson(Map<String, dynamic> json){
    return Character(
        id: json['id'],
        name: json['name'],
        alternateNames: List<String>.from(json['alternate_names']),
        species: json['species'],
        gender: json['gender'],
        house: json['house'],
        dateOfBirth: json['dateOfBirth'],
        wizard: json['wizard'],
        ancestry: json['ancestry'],
        eyeColour: json['eyeColour'],
        hairColour: json['hairColour'],
        wand: Wand.fromJson(json['wand']),
        patronus: json['patronus'],
        hogwartsStudent: json['hogwartsStudent'],
        hogwartsStaff: json['hogwartsStaff'],
        actor: json['actor'],
        alternateActors: List<String>.from(json['alternate_actors']),
        alive: json['alive'],
        image: json['image']);
  }

}

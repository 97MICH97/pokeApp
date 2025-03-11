import 'dart:convert';

GetPokemonModel getPokemonModelFromJson(String str) => GetPokemonModel.fromJson(json.decode(str));

String getPokemonModelToJson(GetPokemonModel data) => json.encode(data.toJson());

class GetPokemonModel {
  List<String> abilities;
  int height;
  int id;
  String name;
  String sprites;
  List<Stat> stats;
  List<String> types;
  int weight;

  GetPokemonModel({
    required this.abilities,
    required this.height,
    required this.id,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory GetPokemonModel.fromJson(Map<String, dynamic> json) => GetPokemonModel(
    abilities: List<String>.from(json["abilities"].map((x) => x["ability"]["name"])),
    height: json["height"],
    id: json["id"],
    name: json["name"],
    sprites: json["sprites"]["front_default"],
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    types: List<String>.from(json["types"].map((x) => x["type"]["name"])),
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "abilities": abilities,
    "height": height,
    "id": id,
    "name": name,
    "sprites": sprites,
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
    "types": types,
    "weight": weight,
  };
}

class Stat {
  int baseStat;
  String name;

  Stat({
    required this.baseStat,
    required this.name,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    name: json["stat"]["name"],
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "name": name,
  };
}


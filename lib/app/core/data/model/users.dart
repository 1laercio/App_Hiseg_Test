import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users(
      {this.id,
      required this.name,
      required this.localization,
      required this.age,
      required this.cpf,
      required this.password,
      this.tipeUser});

  int? id;
  String name;
  String localization;
  String age;
  int? cpf;
  String? password;
  String? tipeUser;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      id: json["id"],
      name: json["name"],
      localization: json["localization"],
      age: json["age"],
      password: json["password"],
      cpf: json["cpf"],
      tipeUser: json["tipeuser"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localization": localization,
        "age": age,
        "cpf": cpf,
        "password": password,
        "tipeuser": tipeUser
      };

  Users copy(
          {int? id,
          String? title,
          String? content,
          int? cpf,
          String? password,
          String? tipeUser}) =>
      Users(
          id: id ?? this.id,
          name: name,
          localization: localization,
          age: age,
          cpf: cpf,
          password: password,
          tipeUser: tipeUser);

  // the toMap() method
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "localization": localization,
      "age": age,
      "cpf": cpf,
      "password": password,
      "tipeuser": tipeUser
      // and so on
    };
  }
}

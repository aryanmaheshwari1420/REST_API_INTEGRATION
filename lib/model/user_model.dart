// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    UserModel({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address,
        required this.phone,
        required this.website,
        required this.company,
    });

    int id;
    String name;
    String username;
    String email;
    Address address;
    String phone;
    String website;
    Company company;

    factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
    };
}

class Address {
    Address({
        required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo,
    });

    String street;
    String suite;
    String city;
    String zipcode;
    Geo geo;

    factory Address.fromJson(Map<dynamic, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
    };
}

class Geo {
    Geo({
        required this.lat,
        required this.lng,
    });

    String lat;
    String lng;

    factory Geo.fromJson(Map<dynamic, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<dynamic, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Company {
    Company({
        required this.name,
        required this.catchPhrase,
        required this.bs,
    });

    String name;
    String catchPhrase;
    String bs;

    factory Company.fromJson(Map<dynamic, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );

    Map<dynamic, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}

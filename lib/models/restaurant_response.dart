// To parse this JSON data, do
//
//     final restaurantsResponse = restaurantsResponseFromMap(jsonString);

import 'dart:convert';

class RestaurantsResponse {
  RestaurantsResponse({
    this.summary,
    this.results,
  });

  Summary? summary;
  List<RestaurantInfo>? results;

  factory RestaurantsResponse.fromJson(String str) =>
      RestaurantsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantsResponse.fromMap(Map<String, dynamic> json) =>
      RestaurantsResponse(
        summary:
            json["summary"] == null ? null : Summary.fromMap(json["summary"]),
        results: json["results"] == null
            ? null
            : List<RestaurantInfo>.from(
                json["results"].map((x) => RestaurantInfo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "summary": summary == null ? null : summary!.toMap(),
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class RestaurantInfo {
  RestaurantInfo({
    this.poi,
    this.address,
    this.position,
  });

  Poi? poi;
  Address? address;
  Position? position;

  factory RestaurantInfo.fromJson(String str) =>
      RestaurantInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantInfo.fromMap(Map<String, dynamic> json) => RestaurantInfo(
        poi: json["poi"] == null ? null : Poi.fromMap(json["poi"]),
        address:
            json["address"] == null ? null : Address.fromMap(json["address"]),
        position: json["position"] == null
            ? null
            : Position.fromMap(json["position"]),
      );

  Map<String, dynamic> toMap() => {
        "poi": poi == null ? null : poi!.toMap(),
        "address": address == null ? null : address!.toMap(),
        "position": position == null ? null : position!.toMap(),
      };
}

class Address {
  Address({
    this.streetNumber,
    this.streetName,
    this.municipality,
  });

  String? streetNumber;
  String? streetName;
  String? municipality;

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        streetNumber:
            json["streetNumber"] == null ? null : json["streetNumber"],
        streetName: json["streetName"] == null ? null : json["streetName"],
        municipality:
            json["municipality"] == null ? null : json["municipality"],
      );

  Map<String, dynamic> toMap() => {
        "streetNumber": streetNumber == null ? null : streetNumber,
        "streetName": streetName == null ? null : streetName,
        "municipality": municipality == null ? null : municipality,
      };
}

class Poi {
  Poi({
    this.name,
    this.phone,
    this.categories,
  });

  String? name;
  String? phone;
  List<String>? categories;

  factory Poi.fromJson(String str) => Poi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Poi.fromMap(Map<String, dynamic> json) => Poi(
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        categories: json["categories"] == null
            ? null
            : List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x)),
      };
}

class Position {
  Position({
    this.lat,
    this.lon,
  });

  double? lat;
  double? lon;

  factory Position.fromJson(String str) => Position.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Position.fromMap(Map<String, dynamic> json) => Position(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
      };
}

class Summary {
  Summary({
    required this.numResults,
    required this.totalResults,
  });

  int numResults;
  int totalResults;

  factory Summary.fromJson(String str) => Summary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Summary.fromMap(Map<String, dynamic> json) => Summary(
        numResults: json["numResults"] == null ? null : json["numResults"],
        totalResults:
            json["totalResults"] == null ? null : json["totalResults"],
      );

  Map<String, dynamic> toMap() => {
        "numResults": numResults == null ? null : numResults,
        "totalResults": totalResults == null ? null : totalResults,
      };
}

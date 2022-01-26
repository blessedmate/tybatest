import 'dart:convert';

import 'package:tyba_test/models/restaurant_response.dart';
import 'package:http/http.dart' as http;

class RestaurantsService {
  List<RestaurantInfo>? restaurants = [];

  final String _urlBase = 'api.tomtom.com';

  /// Sends a request to tomtom API to search for restaurants nearby given coordinates
  Future<String?> searchRestaurantsByCoords(String lat, String lon) async {
    final Map<String, dynamic>? queryParameters = {
      'key': '',
      'lat': lat,
      'lon': lon,
      'radius': '500',
      'limit': '20',
    };

    final url = Uri.https(
        _urlBase, 'search/2/categorySearch/restaurant.json', queryParameters);

    final resp = await http.get(url);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    final RestaurantsResponse restaurantsResponse =
        RestaurantsResponse.fromMap(decodedResp);
    restaurants = restaurantsResponse.results;

    restaurants!.forEach((element) {
      print(element.poi!.name);
    });
  }
}

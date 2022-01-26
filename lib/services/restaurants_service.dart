import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tyba_test/models/restaurant_response.dart';
import 'package:http/http.dart' as http;

class RestaurantsService extends ChangeNotifier {
  List<RestaurantInfo>? restaurants = [];

  final String _urlBase = 'api.tomtom.com';

  /// Sends a request to tomtom API to search for restaurants nearby given coordinates
  Future<String?> searchRestaurantsByCoords(String lat, String lon) async {
    try {
      final Map<String, dynamic>? queryParameters = {
        'key': 'GpKgdkHwolF0DtJk1M3dwJ1Ah2NrB1Pz',
        'lat': lat,
        'lon': lon,
        'radius': '500',
        'limit': '20',
      };

      final url = Uri.https(
          _urlBase, 'search/2/categorySearch/restaurant.json', queryParameters);

      final resp = await http.get(url);
      final Map<String, dynamic> decodedResp = json.decode(resp.body);

      // Convert the decoded response into the data model, then update restaurants list
      final RestaurantsResponse restaurantsResponse =
          RestaurantsResponse.fromMap(decodedResp);
      restaurants = restaurantsResponse.results;

      // Update UI
      notifyListeners();

      for (var element in restaurants!) {
        print(element.poi!.name);
      }
    } catch (e) {
      print(e);
    }
  }
}

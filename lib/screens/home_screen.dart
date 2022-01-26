import 'package:flutter/material.dart';
import 'package:tyba_test/services/restaurants_service.dart';
import 'package:tyba_test/widgets/input_field.dart';
import 'package:tyba_test/widgets/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
      ),
      drawer: const Menu(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SearchBar(),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final RestaurantsService restaurantsService = RestaurantsService();
  String lat = '';
  String lon = '';

  SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: InputField(
            // icon: const Icon(Icons.search),
            labelText: '4.723032,-74.065390...',
            margin: const EdgeInsets.symmetric(horizontal: 8),
            onChanged: (coords) {
              try {
                lat = coords.split(',')[0];
                lon = coords.split(',')[1];
              } catch (error) {
                print(error);
              }
            },
          ),
        ),
        TextButton(
          onPressed: () async {
            await restaurantsService.searchRestaurantsByCoords(lat, lon);
          },
          child: const Icon(Icons.search, color: Colors.indigo),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyba_test/models/restaurant_response.dart';
import 'package:tyba_test/services/restaurants_service.dart';
import 'package:tyba_test/widgets/input_field.dart';
import 'package:tyba_test/widgets/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final restaurantsProvider = Provider.of<RestaurantsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
      ),
      drawer: const Menu(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SearchBar(),
            const SizedBox(height: 20),
            Expanded(
              child: restaurantsProvider.restaurants!.isEmpty
                  ? const Center(
                      child: Text('Search for a restaurant'),
                    )
                  : ListView.builder(
                      itemCount: restaurantsProvider.restaurants!.length,
                      itemBuilder: (context, index) {
                        return RestaurantTile(
                            restaurant:
                                restaurantsProvider.restaurants![index]);
                      }),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantTile extends StatelessWidget {
  final RestaurantInfo restaurant;
  const RestaurantTile({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(restaurant.poi!.name!),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
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
                } catch (error) {}
              },
            ),
          ),
          TextButton(
            onPressed: () =>
                restaurantsService.searchRestaurantsByCoords(lat, lon),
            child: const Icon(Icons.search, color: Colors.indigo),
          ),
        ],
      ),
    );
  }
}

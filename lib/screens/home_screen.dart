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
              child: restaurantsProvider.restaurants.isEmpty
                  ? const Center(
                      child: Text('Search for a restaurant'),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: restaurantsProvider.restaurants.length,
                      itemBuilder: (_, index) => RestaurantTile(
                          restaurant: restaurantsProvider.restaurants[index]),
                    ),
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
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  restaurant.poi!.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                child: const Icon(
                  Icons.phone,
                  color: Colors.indigo,
                ),
                onTap: () {
                  showDialog(
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Phone Number'),
                      content: Text(restaurant.poi!.phone ?? '-'),
                    ),
                    context: context,
                  );
                },
              ),
              // Text(
              //   restaurant.poi!.phone ?? '-',
              //   style: TextStyle(fontSize: 16),
              // ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              Expanded(
                child: Text(
                  '${restaurant.address!.streetName ?? '-'} ${restaurant.address!.streetNumber ?? '-'}',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  String lat = '';
  String lon = '';

  SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantsProvider = Provider.of<RestaurantsService>(context);
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
                restaurantsProvider.searchRestaurantsByCoords(lat, lon),
            child: const Icon(Icons.search, color: Colors.indigo),
          ),
        ],
      ),
    );
  }
}

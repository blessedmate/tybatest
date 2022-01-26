import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () => Navigator.pushReplacementNamed(context, 'home'),
            ),
            ListTile(
              title: const Text('History'),
              onTap: () => Navigator.pushReplacementNamed(context, 'history'),
            ),
            Expanded(child: SizedBox()),
            const Divider(thickness: 2),
            ListTile(
              title: const Text('Sign Out'),
              // TODO: ACTUAL LOGOUT
              onTap: () => Navigator.pushReplacementNamed(context, 'login'),
            ),
          ],
        ),
      ),
    );
  }
}

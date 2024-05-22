import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          //Header
          const DrawerHeader(
            child: Icon(Icons.favorite),
          ),

          //Home
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('H O M E'),
            onTap: () {
              //*Estamos ya en el home
              Navigator.pop(context);
            },
          ),

          //Profile

          //Users
        ],
      ),
    );
  }
}

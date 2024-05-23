import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //Header
              DrawerHeader(
                child: Icon(Icons.favorite,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 25),
//change color scheme
              Padding(
                padding: const EdgeInsets.only(left: 140),
                child: ListTile(
                  leading: const Icon(Icons.color_lens, size: 20),
                  //todo cambiar texto a claro y viceversa
                  title: const Text(
                    'M O D O \nO S C U R O',
                    style: TextStyle(fontSize: 10),
                  ),
                  onTap: () {
                    //todo cambiar esquema de color
                  },
                ),
              ),

              //Home
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('H O M E'),
                  onTap: () {
                    //*Estamos ya en el home
                    Navigator.pop(context);
                  },
                ),
              ),
              //const SizedBox(height: 25),
              //Profile
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('P E R F I L'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ),

              //Users
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text('U S U A R I O S'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/users');
                  },
                ),
              ),
            ],
          ),
          //logout
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('C E R R A R  S E S I O N'),
              onTap: () {
                Navigator.pop(context);
                logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}

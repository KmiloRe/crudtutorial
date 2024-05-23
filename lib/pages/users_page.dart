import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudtutorial/helper_functions/helper_functions.dart';
import 'package:crudtutorial/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
      ),
      drawer: MyDrawer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          //errores
          if (snapshot.hasError) {
            displayErrorMessageToUser(
                context, 'Algo salio mal: $snapshot.error');
            return Text('Error: ${snapshot.error}');
          }

          //loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == null) {
            return const Text('No data');
          }

          //get all users
          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              //extraer data
              final user = users[index];

              return ListTile(
                title: Text(user['username']),
                subtitle: Text(user['email']),
              );
            },
          );
        },
      ),
    );
  }
}

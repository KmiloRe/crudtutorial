import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudtutorial/widgets/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  //current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  //future to fetch user data
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  //todo: a futuro guardar esa data en un
  //todo estado para no tener que hacer la peticion cada vez que se renderiza la pagina
  //quizas cache u otro tipo de data local

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          //loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          //error
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          //data recibida
          else if (snapshot.hasData) {
            //extraer data
            Map<String, dynamic>? user = snapshot.data!.data();

            return Center(
              child: Column(
                children: [
                  Text('Username: ${user!['username']}'),
                  Text('Email: ${user['email']}'),
                ],
              ),
            );
          } else {
            return const Text("No data");
          }

//thanks copilot
          // // if (snapshot.connectionState == ConnectionState.waiting) {
          // //   return const CircularProgressIndicator();
          // // } else if (snapshot.hasData) {
          // //   return Center(
          // //     child: Column(
          // //       mainAxisAlignment: MainAxisAlignment.center,
          // //       children: [
          // //         Text('Username: ${snapshot.data!.data()!['username']}'),
          // //         Text('Email: ${snapshot.data!.data()!['email']}'),
          // //       ],
          // //     ),
          // //   );
          // // } else if (snapshot.hasError) {
          // //   return const Text("Error");
          // // } else {
          // //   return const Text("No data");
          // // }
        },
      ),
    );
  }
}

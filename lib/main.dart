import 'package:crudtutorial/firebase_options.dart';
import 'package:crudtutorial/pages/change_password.dart';
import 'package:crudtutorial/pages/collection_page.dart';
import 'package:crudtutorial/pages/home_page.dart';
import 'package:crudtutorial/pages/profile_page.dart';
import 'package:crudtutorial/pages/users_page.dart';
import 'package:crudtutorial/services/auth/auth.dart';

import 'package:crudtutorial/services/auth/login_or_register.dart';
import 'package:crudtutorial/theme/dark_mode.dart';
import 'package:crudtutorial/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login': (context) => const LoginOrRegister(),
        '/register': (context) => const AuthPage(),
        '/profile': (context) => ProfilePage(),
        '/home': (context) => const HomePage(),
        '/users': (context) => const UsersPage(),
        '/changepassword': (context) => const ChangePassword(),
        '/mycollection': (context) => const Mycollection(),
      },
    );
  }
}

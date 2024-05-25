import 'dart:ui';

import 'package:crudtutorial/helper_functions/helper_functions.dart';
import 'package:crudtutorial/widgets/my_button.dart';
import 'package:crudtutorial/widgets/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  //methods
  void login() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const CircularProgressIndicator());

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      //matar loadind circle
      if (context.mounted) {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      //matar loadind circle
      Navigator.pop(context);
      //show error message to user
      displayErrorMessageToUser(context, e.code);
    }

    //login logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0, left: 20, right: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //*logo
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Hola!')));
                  },
                  child: const SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(
                        image: AssetImage('assets/logoByHam.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 20),
                //* app name
                const Text(
                  'B L A C K L I S T',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                //* email
                MyTextField(
                    hintText: 'Tu correo',
                    obscureText: false,
                    controller: emailcontroller),
                const SizedBox(height: 20),
                //* password
                MyTextField(
                    hintText: 'Clave 1',
                    obscureText: true,
                    controller: passwordcontroller),

                const SizedBox(height: 10),

                //* olvidaste tu contraseña
                Row(
                  children: [
                    const SizedBox(width: 5),
                    GestureDetector(
                      onDoubleTap: () {
                        Navigator.pushNamed(context, '/changepassword');
                      },
                      child: Text(
                        'Olvidaste tu contraseña?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                //* login button
                Mybutton(text: 'Iniciar sesión', onTap: login),

                const SizedBox(height: 20),
                //* register button
                Row(
                  children: [
                    const Text('No tienes cuenta?'),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('  Registrate aqui',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.tertiary)),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

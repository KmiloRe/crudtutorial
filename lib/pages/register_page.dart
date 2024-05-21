import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crudtutorial/helper_functions/helper_functions.dart';
import 'package:crudtutorial/widgets/my_button.dart';
import 'package:crudtutorial/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controllers
  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController confirmpasswordcontroller = TextEditingController();

  //methods
  void registeruser() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const CircularProgressIndicator());

    //password matches ?
    if (passwordcontroller.text != confirmpasswordcontroller.text ||
        passwordcontroller.text.isEmpty) {
      //matar loadind circle
      Navigator.pop(context);
      //show error message to user
      displayErrorMessageToUser(context, "Las claves no coinciden");

      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Las claves no coinciden')));
      return;
    } else {
// try creating user
      try {
        //create user
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
        //matar loadind circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // // if (e.code == 'weak-password') {
        // //   log('The password provided is too weak.');
        // //   displayErrorMessageToUser(context, "La clave es muy débil");
        // // } else if (e.code == 'email-already-in-use') {
        // //   print('The account already exists for that email.');
        // //   displayErrorMessageToUser(
        // //       context, "La cuenta ya existe para ese correo");
        // // }

        //matar loadind circle
        Navigator.pop(context);
        //display error message to user
        displayErrorMessageToUser(context, e.code);
        //log error
        log(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //*logo
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Image Clicked!')));
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
                //* username
                MyTextField(
                    hintText: 'Tu nombre de usuario',
                    obscureText: false,
                    controller: usernamecontroller),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                //* confirm password
                MyTextField(
                    hintText: 'Confirma tu clave 1',
                    obscureText: true,
                    controller: confirmpasswordcontroller),

                const SizedBox(height: 20),
                //* Register button
                Mybutton(text: 'Registrarme', onTap: registeruser),

                const SizedBox(height: 20),
                //* login button
                Row(
                  children: [
                    const Text('Ya tienes cuenta?'),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('  Inicia Sesión',
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

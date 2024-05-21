import 'package:crudtutorial/widgets/my_button.dart';
import 'package:crudtutorial/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});
  //controllers
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  //methods
  void login() {
    //login logic
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
                    Text(
                      'Olvidaste tu contraseña?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
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
                    Text('No tienes cuenta?'),
                    GestureDetector(
                      onTap: onTap,
                      child: Text('  Registrate aqui',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.tertiary)),
                    ),
                  ],
                ),
              ]

              //* app name

              //* email

              //* password

              //* olvidaste tu contraseña

              //* login button

              //* register button
              ),
        ),
      ),
    );
  }
}

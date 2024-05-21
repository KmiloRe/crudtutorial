import 'package:crudtutorial/widgets/my_button.dart';
import 'package:crudtutorial/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //controllers
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  //methods
  void Register() {
    //Register logic
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
                    controller: emailcontroller),
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
                Mybutton(text: 'Registrarme', onTap: Register),

                const SizedBox(height: 20),
                //* login button
                Row(
                  children: [
                    const Text('Ya tienes cuenta?'),
                    GestureDetector(
                      onTap: onTap,
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

import 'package:crudtutorial/helper_functions/helper_functions.dart';
import 'package:crudtutorial/widgets/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController emailcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      displayErrorMessageToUser(context, 'Correo enviado');
    } on FirebaseAuthException catch (e) {
      displayErrorMessageToUser(context, e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Se te enviará un correo con un enlace para cambiar tu contraseña',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              MyTextField(
                  hintText: 'Tu correo',
                  obscureText: false,
                  controller: emailcontroller),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => passwordReset(),
                child: Text(
                  'Enviar correo',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

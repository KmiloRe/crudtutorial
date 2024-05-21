import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
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
            ]

            //* app name

            //* email

            //* password

            //* olvidaste tu contraseña

            //* login button

            //* register button
            ),
      ),
    );
  }
}

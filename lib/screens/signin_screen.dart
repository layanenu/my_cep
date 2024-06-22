import 'package:flutter/material.dart';
import 'package:my_cep/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import '../routes/app_routes.dart';


class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) { 
    AuthProvider authProvider = context.watch<AuthProvider>();
    String? message = authProvider.message;

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isLargeScreen = screenWidth > 600;

    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isLargeScreen ? 500 : screenWidth * 0.8,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String email = emailController.text;
                      String password = passwordController.text;
                      authProvider.signIn(email, password).then(
                        (response) => Navigator.pushNamed(context, AppRoutes.consultaCep),
                      );
                    },
                    child: const Text("Acessar"),
                  ),
                  if (message != null) Text(message),
                  const SizedBox(height: 20),
                  ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  }, 
                  child: const Text("Ainda não tenho cadastro"),
                ),
                SizedBox(height: screenHeight * 0.1)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
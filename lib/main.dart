import 'package:flutter/material.dart';
import 'package:my_cep/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_cep/screens/signin_screen.dart';
import 'package:my_cep/screens/signup_screen.dart';
import 'package:my_cep/screens/consulta_cep_screen.dart';
import 'package:my_cep/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(), 
      child: MaterialApp(
        initialRoute: AppRoutes.initialRoute,
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.initialRoute: (context) => SigninScreen(),
          AppRoutes.signup: (context) => SignUpScreen(),
          AppRoutes.consultaCep: (context) => ConsultaCepScreen(),
        },
      ),
    );
  }
}

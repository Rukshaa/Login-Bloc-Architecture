import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/auth_bloc_provider.dart';
import 'package:login_bloc/src/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Bloc",
     debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: AuthBLocProvider(
              child: LoginScreen(),
          ),
        ),
      ),
    );
  }
}

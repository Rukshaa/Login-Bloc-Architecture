import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/auth_bloc.dart';

class AuthBLocProvider extends InheritedWidget{

 final AuthBloc bloc = AuthBloc();
  AuthBLocProvider({Key? key, required Widget child}) :super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
  return true;

  }

  static AuthBloc of (BuildContext context) {
 return context.dependOnInheritedWidgetOfExactType<AuthBLocProvider>()!.bloc;
  }

}
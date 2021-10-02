import 'dart:async';

import 'package:login_bloc/src/mixins/auth_validation_mixing.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc with AuthValidationMixin {

  final BehaviorSubject<String> _emailController = BehaviorSubject();
  final BehaviorSubject<String>  _passwordController =BehaviorSubject();
  final BehaviorSubject<String>  _genderController = BehaviorSubject();

  //getters ro add values to stream
  Function(String val) get addEmail => _emailController.sink.add;
  Function(String val) get addPassword => _passwordController.sink.add;
  Function(String val) get addGender => _genderController.sink.add;

  //getters for listening to stream
  Stream<String> get emailStream =>_emailController
      .stream.transform(emailValidator);
  Stream<String> get passwordStream =>_passwordController
      .stream.transform(passwordValidator);
  Stream<String> get genderStream =>_genderController
      .stream.transform(genderValidator);

  Stream<bool> get submitStream => CombineLatestStream.combine3(
    emailStream, passwordStream, genderStream, (a,b,c) => true);

  void submitData(){
    String email = _emailController.value;
    String password = _passwordController.value;
    String gender = _genderController.value;
  print("Email is $email, password is $password and gender is $gender");
  }

  void dispose(){
  _emailController.close();
  _passwordController.close();
  _genderController.close();
}
}

// final bloc =_AuthBloc();


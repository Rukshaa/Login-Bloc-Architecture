import 'dart:async';

import 'package:login_bloc/src/mixins/auth_validation_mixing.dart';

class _AuthBloc with AuthValidationMixin {

  final StreamController<String> _emailController = StreamController();
  final StreamController<String>  _passwordController = StreamController();
  final StreamController<String>  _genderController = StreamController();

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

void dispose(){
  _emailController.close();
  _passwordController.close();
  _genderController.close();
}
}

final bloc =_AuthBloc();
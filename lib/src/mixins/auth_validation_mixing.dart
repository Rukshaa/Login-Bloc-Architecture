import 'dart:async';

class AuthValidationMixin {
  final emailValidator =
  StreamTransformer<String,String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains("@") && email.contains(".")){
        sink.add(email);
      } else{
        sink.addError("Invalid email address");
      }
    }
  );

  final passwordValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (password, sink){
      if(password.length>4) {
        sink.add(password);

      } else{
        sink.addError("Password must be at least 5 characters long");
      }
    }
  );

  final genderValidator = StreamTransformer<String, String>.fromHandlers(
    handleData:(gender,sink){
      if (gender != "I don't wish to answer") {
        sink.add(gender);
      } else {
        sink.addError("Please choose either male or female");
      }
    });
}

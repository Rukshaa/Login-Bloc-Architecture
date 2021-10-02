import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/auth_bloc.dart';
import 'package:login_bloc/src/blocs/auth_bloc_provider.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
 // final bloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
   AuthBloc bloc = AuthBLocProvider.of(context);
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          buildEmailField(bloc),
          SizedBox(height: 16),
          buildPasswordField(bloc),
          SizedBox(height: 16),
          buildGenderDropdown(bloc),
          SizedBox(height: 16),
          buildSubmitButton(),

        ],
      ),
    );
  }

  Widget buildEmailField(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email address",
            hintText: "you@example.com",
            errorText: snapshot.error?.toString(),
            // errorText:snapshot.hasError? snapshot.error.toString(): null),
            border: OutlineInputBorder(),
          ),
          onChanged: (val) {
            bloc.addEmail(val);
          },

        );
      },
    );
  }
  Widget buildPasswordField(AuthBloc bloc){
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          obscureText:true,
          decoration: InputDecoration(
              labelText: "Your password",
              hintText: "password",
              border: OutlineInputBorder(),
            errorText: snapshot.error?.toString(),
          ),
            onChanged: (val) {
              bloc.addPassword(val);
            }
        );
      }
    );

    }

  Widget buildGenderDropdown(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.genderStream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return DropdownButtonFormField<String>(
          items: [
            DropdownMenuItem(child: Text("Female") ,value: "female"),
            DropdownMenuItem(child: Text("Male"), value: "male"),
            DropdownMenuItem(child: Text("I don't wish to answer"), value: "I don't wish to answer"),
          ],
          onChanged: (val){
              bloc.addGender(val!);
          },
          decoration: InputDecoration(
              labelText: "Your gender",
              hintText: "male/female",
              border: OutlineInputBorder(),
          errorText: snapshot.error?.toString(),
          ),
        );
      }
    );
  }

  Widget buildSubmitButton(){
    return Container(
      width:double.infinity,
      child: ElevatedButton(
        child: Text("Submit"),
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12),
          primary: Colors.teal
        ),
      ),
    );
  }


}

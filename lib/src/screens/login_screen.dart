import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }
}

Widget emailField(Bloc bloc) {
  return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'you@example.com',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      });
}

Widget passwordField(Bloc bloc) {
  return StreamBuilder<String>(
    stream: bloc.password,
    builder: (context, snapshot) {
      return TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter password here',
          errorText: snapshot.error,
        ),
        onChanged: bloc.changePassword,
      );
    },
  );
}

Widget submitButton(Bloc bloc) {
  return StreamBuilder<bool>(
    stream: bloc.submitValid,
    builder: (context, snapshot) => RaisedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.blue,
        ),
  );
}

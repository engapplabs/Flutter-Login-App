import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@example.com',
        
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Senha',
          hintText: 'Digite sua senha'
      ),
  );
}

  Widget submitButton() {
    return RaisedButton(
      color: Colors.red[100],
      child: Text('Submit'),
      onPressed: () {},
    );
  }
}
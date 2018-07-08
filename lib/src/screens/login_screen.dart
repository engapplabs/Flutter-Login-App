import 'package:flutter/material.dart';
import '../mixins//validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixing {
  // Habilidade de referenciar um widget específico
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        // Widget específico referenciado
        key: formKey, 
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            // Dar um marginTop em relação ao botão submit
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
      // Referenciando a função para validar email
      validator: validateEmail,
      onSaved: (String value) {
          email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Senha',
          hintText: 'Digite sua senha'
      ),
        // Referenciando a função para validar senha
        validator: validatePassword,
        onSaved: (String value) {
          password = value;
        },
  );
}

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        // Método para validar os TextFormFields. Se for válido...
        if (formKey.currentState.validate()) {
            // Salvar o que foi digitado
            formKey.currentState.save();
            print('Time to post $email and $password to my API');
        }  
      },
    );
  }
}

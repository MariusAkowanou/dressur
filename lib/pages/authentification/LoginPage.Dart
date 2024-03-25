import 'package:flutter/material.dart';
import 'package:dressur/widgets/CustomAppBar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Connexion',
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre email';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Email invalide';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Mot de passe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  } else if (value.length < 8 || !RegExp(r'^[a-zA-Z0-9!@#$%^&*]+$').hasMatch(value)) {
                    return 'Mot de passe invalide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Container(
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                    // TODO: Gérer la connexion (remplacer par votre logique)
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    // Affichage d'un message d'information
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Connexion en cours...')),
                    );
                  }
                      },
                      child: Text(
                        'Connection',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}

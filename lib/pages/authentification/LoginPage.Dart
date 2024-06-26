import 'package:flutter/material.dart';
import 'package:dressur/widgets/CustomAppBar.dart';
import 'package:dressur/model/authUser.dart';
import 'package:dressur/widgets/color.dart';
import 'package:dressur/pages/presantationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final passWordRegExp = RegExp(r'^[a-zA-Z0-9!@#$%^&*]+$');
  bool _passwordVisible = false;
  bool _isLoading = false; // Variable pour gérer l'état de chargement


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                 focusNode: _emailFocusNode,
                onFieldSubmitted: (_) {
                   FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
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
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                focusNode: _passwordFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  } else if (value.length < 8 ||
                      !passWordRegExp.hasMatch(value)) {
                    String valide = "";
                    if (value.length < 8) {
                      valide = "au moins 8 caractères";
                    } else if (!passWordRegExp.hasMatch(value)) {
                      valide = "entrer un mot de passe valide ";
                    }
                    return valide;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Container(
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  onPressed: () async {
                     
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true; // Activer l'état de chargement
                      });
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      String langUserPhone = 'fr';
                        // Vérifier si l'utilisateur existe déjà dans la base de données
                      final connect = await connexion(langUserPhone,email, password);
                      print(connect);


                      setState(() {
                        _isLoading = false; // Désactiver l'état de chargement
                        
                      });
                       if (connect == 'Connecter') {
                      
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isLoggedIn', true);
                        await prefs.setString('lastPage', '/presentation');
                        
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => PresentationPage()),
                          (Route<dynamic> route) => false,
                        );
                        
                        _emailController.clear();
                        _passwordController.clear();
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(connect),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }
                    }
                  },
                 child: _isLoading? 
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ): Text(
                      'Connection',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

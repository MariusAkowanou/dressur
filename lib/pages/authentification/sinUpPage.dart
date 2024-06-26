import 'package:dressur/model/authUser.dart';
import 'package:dressur/model/data_base.dart';
import 'package:dressur/pages/presantationPage.dart';
import 'package:dressur/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SinUpPage extends StatefulWidget {
  const SinUpPage({super.key});

  @override
  State<SinUpPage> createState() => _SinUpPageState();
}

class _SinUpPageState extends State<SinUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usermailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameUserController = TextEditingController();
  final _numUserController = TextEditingController();
  String _phoneNumber = '';

  // FocusNodes pour chaque champ
 final _nameFocusNode = FocusNode();
 final _emailFocusNode = FocusNode();
 final _phoneFocusNode = FocusNode();
 final _passwordFocusNode = FocusNode();

  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final passWordRegExp = RegExp(r'^[a-zA-Z0-9!@#$%^&*]+$');
  

  bool _passwordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _usermailController.dispose();
    _passwordController.dispose();
    _nameUserController.dispose();
    _numUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Inscription'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
           
              SizedBox(height: 5.0),
              TextFormField(
                controller: _nameUserController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                ),
                focusNode: _nameFocusNode,
                onFieldSubmitted: (_) {
                   FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez votre nom';
                  } else if (!RegExp(r'^[a-zA-Z\s-]+$').hasMatch(value)) {
                    return 'Le nom ne doit contenir que des lettres, des espaces et des tirets';
                  }
                  return null;
                },
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _usermailController,
                decoration: InputDecoration(
                  labelText: 'Adresse email',
                ),
                focusNode: _emailFocusNode,
                onFieldSubmitted: (_) {
                   FocusScope.of(context).requestFocus(_phoneFocusNode);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre email';
                  } else if (!emailRegExp.hasMatch(value)) {
                    return 'Email invalide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 5.0),
              
              IntlPhoneField(
                controller: _numUserController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Téléphone',
                
                ),
                initialCountryCode: 'BJ',
                onChanged: (phone) {
                  _phoneNumber = phone.completeNumber;
                },
                focusNode: _phoneFocusNode,
               validator: (value) {
                  if (value == null || value.number.isEmpty) {
                    return 'Veuillez entrer un numéro de téléphone valide';
                  }
                  if (value.number.contains(RegExp(r'[a-zA-Z]'))) {
                    return 'Le numéro de téléphone ne doit pas contenir de lettres';
                  }
                  return null;
                },

              ),
              
              SizedBox(height: 5.0),
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                    onPressed: ()  async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                         _isLoading = true; // Activer l'état de chargement
                        });

                        String usermail = _usermailController.text;
                        String password = _passwordController.text;
                        String numUser = _phoneNumber;
                        String nameUser = _nameUserController.text;
                        
                        String resul = await inscription(nameUser, numUser, usermail, password);
                        //final sendMail= await sendVerificationCode(usermail);
                        print(resul);
                        setState(() {
                          _isLoading = false; // Désactiver l'état de chargement
                        
                        });
                        if (resul == 'succes') {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('isLoggedIn', true);
                          await prefs.setString('lastPage', '/presentation');

                          sendVerificationCodeToUser(usermail);
                         // print(verification);
                          _usermailController.clear();
                          _passwordController.clear();
                          _nameUserController.clear();
                          _numUserController.clear();
                          
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => PresentationPage()),
                            (Route<dynamic> route) => false,
                          );
                          
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(resul),
                              duration: Duration(seconds: 20),
                            ),
                          );
                        }
                      }
                    },
                    child: _isLoading? 
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ):Text(
                      "S'inscrire",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Flexible(
                    child: Text("Vous avez déjà un compte?"),
                  ),
                  Flexible(
                      child: TextButton(
                          onPressed: () async {
                             SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString('lastPage', '/presentation');
                             Navigator.pushReplacementNamed(context, '/login');
                          }, child: Text("Se connecté ")))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void sendVerificationCodeToUser(String email) async {
 String? userUid = await DatabaseHelper().getUserUid(email);
 if (userUid != null) {
    String result = await sendVerificationCode(email, userUid);
    print(result);
 } else {
    print('Utilisateur non trouvé');
 }
}
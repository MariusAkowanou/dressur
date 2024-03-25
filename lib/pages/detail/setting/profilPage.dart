import 'package:dressur/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Modifier profil'),
      body: Container(
      child: ListView(
        children: [
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Pseudo'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre pseudo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),  
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre email';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Veuillez entrer une adresse email valide';
                  }
                  return null;
                },

              ),
              Text( 
                "Cet email sera votre idantifiant de connexion",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 16),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Téléphone',
                  
                ),
                initialCountryCode: 'BJ',
                onChanged: (phone) {
                  _phoneNumber = phone.completeNumber;
                },
              ),
              
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Faire quelque chose avec les données du formulaire
                    // Par exemple, enregistrer les modifications du profil
                    // Vous pouvez accéder aux données à l'aide des contrôleurs
                    print('Nom: ${_nameController.text}');
                    print('Prénom: ${_surnameController.text}');
                    print('Pseudo: ${_usernameController.text}');
                    print('Email: ${_emailController.text}');
                    print('Téléphone: $_phoneNumber');
                  }
                },
                child: Text('Valider'),
              ),
            ],
          ),
        ),
      ),
   
        ],
      ),
      
    ));
  }
}

import 'dart:convert';
import 'package:dressur/model/data_base.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

final String baseUrl = 'http://192.168.100.14:8000/api';

String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var digest = sha256.convert(bytes);
  return digest.toString();
}

//requete pour l'inscripton de l'utilisateur 

Future<String> inscription(String pseudo, String tel, String mail, String password) async {
  final String apiUrl = '$baseUrl/inscription';
  DatabaseHelper dbHelper = DatabaseHelper();

  final Map<String, String> requestData = {
    'langUserPhone': 'fr',
    'pseudo': pseudo,
    'tel': tel,
    'mail': mail,
    'password': password,
  };
  
  try {
    final http.Response response =
      await http.post(Uri.parse(apiUrl), body: requestData);
      
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
  
      if (data['error'] == true) {
        return data["message"].toString();
      } else {
        await dbHelper.insertUser(data["user"]);
        return "succes";
      }
    }else {    
      return "Une erreur s'est produite lors de l'inscription ";

    }
  } catch (e) {
    return "Une erreur s'est produite: $e";
  }
}

//connexion de l'utilisateur 
Future<String> connexion(String langUserPhone, String mail, String password) async {
  final String apiUrl = '$baseUrl/connexion';

  final Map<String, String> requestData = {
    'langUserPhone': langUserPhone,
    'mail': mail,
    'password': password,
  };

  try {
    final http.Response response =
        await http.post(Uri.parse(apiUrl), body: requestData);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        return data["error"].toString();
      } else {
        return "Connecter";
      }
    } else {
      return "Une erreur s'est produite lors de la connexion";
    }
  } catch (e) {
    return "Une erreur s'est produite: $e";
  }
}

//connexion vers de verification de mail 
Future<String> sendVerificationCode(String email, String uid) async {
 final String apiUrl = '$baseUrl/sendMailVerification';

 final Map<String, String> requestData = {
    'email': email,
    'uid': uid, 
 };

 try {
    final http.Response response = await http.post(Uri.parse(apiUrl), body: requestData);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);
      if (data['error'] == true) {
        return data['message'].toString();
      } else {
        return 'Code de vérification envoyé à $email avec success';
      }
    } else {
      // La requête a échoué
      return 'Error de requête : ${response.statusCode}';
    }
 } catch (e) {
    // Une erreur s'est produite lors de la requête
    return 'Une erreur s\'est produite : $e';
 }
}


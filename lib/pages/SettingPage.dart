import 'package:dressur/pages/authentification/sinUpPage.dart';
import 'package:dressur/pages/detail/setting/profilPage.dart';
import 'package:dressur/pages/detail/setting/validationPage.dart';
import 'package:dressur/widgets/CustomAppBarPage.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarPage(title: "Compte"),
      body: ListView(
        children: [
          _buildProfileSection(),
          TitleInfoBuld(),
          _buildBonusSection(),
          TitleInfoBuld(),
          _buildAboutSection(),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Déconnexion'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        SizedBox(height: 10),
        _buildAvatar(),
        SizedBox(height: 10),
        Center(
          child: Text(
            "UserPseudo",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
          SizedBox(height: 10),
        
          Divider(),
        TitleInfoBuld(),
        _buildListItem(Icons.person, 'Modifier mon profil' ,ProfilPage()),
        _buildListItem(Icons.verified, 'Verification' ,ValidationPage()),
      ],
    );
  }

  Widget _buildBonusSection() {
    return Column(
      children: [
        _buildListItem(Icons.people, 'Parrainage' ,SinUpPage()),
        _buildListItem(Icons.card_giftcard_outlined, 'Mes code Promo' ,SinUpPage()),
        _buildListItem(Icons.wallet_membership, 'Carte de visite' ,SinUpPage()),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Column(
      children: [
        _buildListItem(Icons.info_outline, 'A propos' ,SinUpPage()),
        _buildListItem(Icons.card_giftcard_outlined, 'Signaler un utilisateur' ,SinUpPage()),
        _buildListItem(Icons.wallet_membership, 'Support client' ,SinUpPage()),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black,
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage("images/img6.jpg"),
      ),
    );
  }

  Widget _buildListItem(IconData icon, String label, Widget page) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20),
      child: TextButton.icon(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
        },
        icon: Icon(icon),
        label: Text(label, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}

Widget TitleInfoBuld() {
  return Container(
    child: ListTile(
      leading: Icon(
        Icons.fiber_manual_record,
        size: 10,
      ),
      title: Text(
        'Information personnel',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  );
}

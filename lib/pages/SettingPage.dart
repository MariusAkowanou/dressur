import 'package:dressur/pages/authentification/firstePage.dart';
import 'package:dressur/widgets/CustomAppBarPage.dart';
import 'package:dressur/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              title: Container(
                
                child: TextButton(
                   style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 5, 5, 5),
                    alignment: Alignment.centerLeft,
                  ),
                  child: Text("Deconnexion"),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIn', false);
                    await prefs.setString('lastPage', '/fistView');
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => FistView()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              )),
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
        _buildListItem(Icons.person, 'Modifier mon profil', '/profil'),
        _buildListItem(Icons.verified, 'Verification', '/validation'),
      ],
    );
  }

  Widget _buildBonusSection() {
    return Column(
      children: [
        _buildListItem(Icons.people, 'Parrainage', '/validation'),
        _buildListItem(
            Icons.card_giftcard_outlined, 'Mes code Promo', '/validation'),
        _buildListItem(
            Icons.wallet_membership, 'Carte de visite', '/validation'),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Column(
      children: [
        _buildListItem(Icons.info_outline, 'A propos', '/validation'),
        _buildListItem(Icons.card_giftcard_outlined, 'Signaler un utilisateur',
            '/validation'),
        _buildListItem(
            Icons.wallet_membership, 'Support client', '/validation'),
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

  Widget _buildListItem(IconData icon, String label, String page) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20),
      child: TextButton.icon(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            page,
          );
        },
        icon: Icon(
          icon,
          color: SecondColor,
        ),
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

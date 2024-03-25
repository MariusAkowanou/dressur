import 'package:dressur/widgets/color.dart';
import 'package:flutter/material.dart';

class BoxDialog extends StatelessWidget {
  const BoxDialog({required this.button});
  final String button;

  // Définition de la fonction asynchrone
  Future<void> _showBoostContactDialog(BuildContext context) async {
    String? selectedRatio = 'Boost gratuit'; // Mettre "Boost gratuit" par défaut
    String boostAmount = ''; // Variable pour stocker le montant du boost
    String? selectedFormula; // Variable pour stocker la formule sélectionnée

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(
                'Boost contact',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              content: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedRatio,
                      onChanged: (value) {
                        setState(() {
                          selectedRatio = value;
                        });
                      },
                      items: ['Boost payant', 'Boost gratuit']
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          ).toList(),
                      decoration: InputDecoration(
                        labelText: 'Choisir le ratio',
                      ),
                    ),
                    if (selectedRatio == 'Boost gratuit') ...[
                      DropdownButtonFormField<String>(
                        value: selectedFormula,
                        onChanged: (value) {
                          setState(() {
                            selectedFormula = value;
                          });
                        },
                        items: ['Formule 1', 'Formule 2']
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        decoration: InputDecoration(
                          labelText: 'Choisir la formule',
                        ),
                      ),
                    ],
                    if (selectedRatio == 'Boost payant') ...[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Montant du boost',
                        ),
                        onChanged: (value) {
                          boostAmount = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Code de confirmation',
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Fermer'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Valider'),
                  onPressed: () {
                    // Utiliser les données sélectionnées ou saisies
                    print('Ratio sélectionné: $selectedRatio');
                    if (selectedRatio == 'Boost gratuit') {
                      print('Formule sélectionnée: $selectedFormula');
                    }
                    print('Montant du boost: $boostAmount');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(
          SecondColor),
      ),
      onPressed: () async {
        await _showBoostContactDialog(context);
      },
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
            weight: 2,
          ),
          SizedBox(width: 3,),
          Text(
            button,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

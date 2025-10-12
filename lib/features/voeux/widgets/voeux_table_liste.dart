import 'package:flutter/material.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/utils/app_style.dart';

class VoeuxTableListe extends StatelessWidget {
  const VoeuxTableListe({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const {
        0: FlexColumnWidth(1.5), // Nom
        1: FlexColumnWidth(1.5), // Prénom
        2: FlexColumnWidth(1.2), // Session
        3: FlexColumnWidth(1.2), // Semestre
        4: FlexColumnWidth(1.0), // Niveau
        5: FlexColumnWidth(1.5), // Seance
        6: FlexColumnWidth(1.5), // Actions
      },
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text('Nom', style: AppStyles.style18Medium(context)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text('Prénom', style: AppStyles.style18Medium(context)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text('Session', style: AppStyles.style18Medium(context)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text('Semestre', style: AppStyles.style18Medium(context)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text('Jour', style: AppStyles.style18Medium(context)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text('Seance', style: AppStyles.style18Medium(context)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text('Actions', style: AppStyles.style18Medium(context)),
            ),
          ],
        ),
        _buildTableRow(
          'Msallem',
          'Houssein',
          Session.partiel,
          Seance.s2,
          Semestre.sem1,
          3,
        ),
      ],
    );
  }

  TableRow _buildTableRow(
    String nom,
    String prenom,
    Session session,
    Seance seance,
    Semestre semestre,
    int jour,
  ) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(8.0), child: Text(nom)),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(prenom)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(session.toString()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(semestre.toString()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(jour.toString()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(seance.toString()),
        ),
        Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.delete)),
      ],
    );
  }
}

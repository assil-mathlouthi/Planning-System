import 'package:flutter/material.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/utils/app_style.dart';

class voeuxTableListe extends StatelessWidget {
  const voeuxTableListe({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
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
              child: Text('Niveau', style: AppStyles.style18Medium(context)),
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
          Semestre.sem1,
          "3GL1",
        ),
      ],
    );
  }

  TableRow _buildTableRow(
    String nom,
    String prenom,
    Session session,
    Semestre semestre,
    String /*Niveau (enum) */ niveau,
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
          child: Text(niveau.toString()),
        ),
      ],
    );
  }
}

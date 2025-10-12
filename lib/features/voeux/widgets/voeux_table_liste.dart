import 'package:flutter/material.dart';
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
        _buildTableRow('John', 'john@university.edu', 'Computer Science'),
        _buildTableRow('Jane Smith', 'jane@university.edu', 'Mathematics'),
        _buildTableRow('Bob Wilson', 'bob@university.edu', 'Physics'),
      ],
    );
  }

  TableRow _buildTableRow(String name, String email, String department) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(8.0), child: Text(name)),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(email)),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(department)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planning_system/features/voeux/widgets/voeux_table_liste.dart';

class voeuxTable extends StatelessWidget {
  const voeuxTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Liste des voeux importés"),
          TextField(
            decoration: InputDecoration(
              hintText: "Rechercher un voeux",
              prefixIcon: Icon(Icons.search),
            ),
          ),
          voeuxTableListe(),
        ],
      ),
    );
  }
}

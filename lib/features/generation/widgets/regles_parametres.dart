import 'package:flutter/widgets.dart';
import 'package:planning_system/core/common/important_widget.dart';
import 'package:planning_system/core/utils/app_style.dart';

class ReglesParametres extends StatelessWidget {
  const ReglesParametres({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            style: AppStyles.style18Regular(context),
            'Paramètres de génération',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: ImportantWidget(
              subTitle:
                  "Veuillez importer tous les fichiers requis (enseignants, examens et vœux) avant de générer le planning.",
              title: "Donnés Manquantes",
            ),
          ),
        ],
      ),
    );
  }
}

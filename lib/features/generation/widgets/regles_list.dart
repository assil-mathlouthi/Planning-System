import 'package:flutter/widgets.dart';
import 'package:planning_system/features/generation/widgets/regles_item.dart';

class ReglesList extends StatelessWidget {
  //TODO: Change this to take params to dynamically add list items, maybe for each checked parameter render a list
  const ReglesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReglesItem(
          title: "Respect aux preferences",
          details: "Priorité aux voeux des enseignants",
        ),
        SizedBox(height: 12),
        ReglesItem(
          title: "Charge equilibrée",
          details: "Distribution équitable",
        ),
        SizedBox(height: 12),
        ReglesItem(
          title: "Pas de conflits",
          details: "Eviter les doubles affectations",
        ),
      ],
    );
  }
}

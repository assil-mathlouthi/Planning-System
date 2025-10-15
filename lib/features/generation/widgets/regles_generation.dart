import 'package:flutter/widgets.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/generation/widgets/regles_list.dart';

class ReglesGeneration extends StatelessWidget {
  const ReglesGeneration({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(style: AppStyles.style18Regular(context), 'Règles appliquées'),
          SizedBox(height: 30),
          ReglesList(),
        ],
      ),
    );
  }
}

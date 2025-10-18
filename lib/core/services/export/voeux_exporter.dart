import 'package:drift/drift.dart' show QueryRow;
import 'package:planning_system/core/interface/exporter_interface.dart';

class VoeuxExporter implements ExcelExporter<QueryRow> {
  const VoeuxExporter();

  @override
  List<String> get headers => const [	
    'Nom',
    'Prénom',
    'Session',
    'Semestre',
    'jour',
    'Séance',
   
  ];

  @override
  List<dynamic> mapRow(QueryRow item) => [
    item.read<String>('nomEns'),
    item.read<String>('prenomEns'),
    item.read<String>('session'),
    item.read<String>('semestre'),
    item.read<int>('jour'),
    item.read<String>('seance'),
   
  ];

  @override
  String get sheetName => 'Sheet1';
}

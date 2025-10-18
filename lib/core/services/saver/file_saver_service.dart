import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:planning_system/core/interface/file_saver_interface.dart';

class LocalFileSaver implements FileSaverInterface {
  const LocalFileSaver();

  @override
  Future<String> saveBytes({
    required List<int> bytes,
    required String suggestedFileName,
    String extension = 'xlsx',
  }) async {
    final cleanExt = extension.replaceAll('.', '').toLowerCase();
    final suggested = suggestedFileName.toLowerCase().endsWith('.$cleanExt')
        ? suggestedFileName
        : '$suggestedFileName.$cleanExt';

    final String? selectedPath = await FilePicker.platform.saveFile(
      dialogTitle: 'Save As',
      fileName: suggested,
      type: FileType.custom,
      allowedExtensions: [cleanExt],
    );

    if (selectedPath == null) {
      throw Exception('Save canceled');
    }
    final String finalPath = selectedPath.toLowerCase().endsWith('.$cleanExt')
        ? selectedPath
        : '$selectedPath.$cleanExt';

    final file = File(finalPath);
    await file.writeAsBytes(bytes, flush: true);
    return finalPath;
  }
}

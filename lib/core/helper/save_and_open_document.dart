import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';

class SaveAndOpenDocument {
  /// Saves the PDF to the user's Downloads folder (or Documents if unavailable)
  static Future<File?> savePdf({
    required String name,
    required Document pdf,
  }) async {
    try {
      final bytes = await pdf.save();
      final downloadsDir = await _getDownloadsDirectory();

      final file = File('${downloadsDir.path}/$name');
      await file.writeAsBytes(bytes);
      debugPrint('PDF saved to: ${file.path}');

      return file;
    } catch (e) {
      debugPrint('Failed to save PDF: $e');
      return null;
    }
  }

  /// Opens the given PDF file using the system default app
  static Future<void> openPdf(File file) async {
    await OpenFile.open(file.path);
  }

  /// Determines a proper Downloads or fallback directory
  static Future<Directory> _getDownloadsDirectory() async {
    try {
      if (Platform.isWindows) {
        return Directory('${Platform.environment['USERPROFILE']}\\Downloads');
      } else if (Platform.isMacOS || Platform.isLinux) {
        return Directory('${Platform.environment['HOME']}/Downloads');
      } else {
        return Directory.systemTemp;
      }
    } catch (_) {
      return Directory.systemTemp;
    }
  }
}

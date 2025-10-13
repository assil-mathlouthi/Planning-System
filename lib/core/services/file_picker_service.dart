
import 'package:file_picker/file_picker.dart';
import 'package:planning_system/core/interface/file_picker_interface.dart';

class FilePickerService implements FilePickerInterface {

  @override
  Future<String> pickFilePath({
    List<String> allowedExtensions = const [],
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
    );

    if (result == null) {
      return "";
    }
    return result.files.single.path ?? "";
  }
}

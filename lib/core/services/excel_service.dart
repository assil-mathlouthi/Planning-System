import 'package:file_picker/file_picker.dart';

class ExcelService {
  ExcelService._internal();

  // singleton pattern
  static final ExcelService _instance = ExcelService._internal();
  // always return the same instance of my class (change it later if need)
  factory ExcelService() {
    return _instance;
  }

  // void readExceldata() {
  //   // need to support file picking
  //   var file = 'Path_to_pre_existing_Excel_File/excel_file.xlsx';
  //   var bytes = File(file).readAsBytesSync();
  //   var excel = Excel.decodeBytes(bytes);
  // }

  // ya assil hethi fil future badel supporti ay type bte3 files
  // twali app ta9bar csv w pdf w ....
  Future<String> pickExcelFilePath() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result == null) {
      return "";
    }
    return result.files.single.path ?? "";
  }
}

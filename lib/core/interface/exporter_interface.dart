abstract class ExcelExporter<T> {
  const ExcelExporter();
  List<String> get headers;
  List<dynamic> mapRow(T item);
  String get sheetName => 'Sheet1';
}

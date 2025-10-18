import 'package:excel/excel.dart';

abstract class ExcelParser<T> {
  const ExcelParser();

  int get startRowIndex => 1;

  T parseRow(List<Data?> row);
}
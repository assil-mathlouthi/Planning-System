import 'package:dartz/dartz.dart';
import 'package:excel/excel.dart';
import 'package:planning_system/core/errors/failure.dart';

abstract class ExcelParser<T> {
  const ExcelParser();

  int get startRowIndex => 1;

  T parseRow(List<Data?> row);
}

abstract class ExcelInterface {
  Future<Either<Failure, List<T>>> readExcelData<T>({
    required ExcelParser<T> parser,
  });
}

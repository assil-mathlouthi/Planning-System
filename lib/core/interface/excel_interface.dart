import 'package:dartz/dartz.dart';
import 'package:planning_system/core/errors/failure.dart';
import 'package:planning_system/core/interface/exporter_interface.dart';
import 'package:planning_system/core/interface/parser_interface.dart';




abstract class ExcelInterface {
 
  Future<Either<Failure, String>> exportExcelData<T>({
    required Iterable<T> data,
    required ExcelExporter<T> exporter,
    String? fileName,
  });
  Future<Either<Failure, List<T>>> readExcelData<T>({
    required ExcelParser<T> parser,
  });
}

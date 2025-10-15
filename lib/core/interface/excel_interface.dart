import 'package:dartz/dartz.dart';
import 'package:planning_system/core/errors/failure.dart';

abstract class ExcelInterface<T> {
  Future<Either<Failure, List<T>>> readExcelData();
}

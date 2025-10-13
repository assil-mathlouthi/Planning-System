// This file may be deleted I just keep it to take an idea of possible models I'm 
// gonna use in the app to work with the excel data in the app
/// A lightweight preview of a sheet.
class ExcelPreview {
  ExcelPreview({
    required this.sheetName,
    required this.headers,
    required this.sampleRows,
    required this.totalColumns,
    this.estimatedTotalRows,
  });

  final String sheetName;
  final List<String> headers;
  final List<Map<String, dynamic>> sampleRows; // up to maxRows
  final int totalColumns;
  final int? estimatedTotalRows;
}

/// Validation outcome for an Excel file/sheet.
class ValidationResult {
  ValidationResult({
    required this.isValid,
    required this.missingHeaders,
    required this.errors,
  });

  final bool isValid;
  final List<String> missingHeaders;
  final List<ExcelError> errors;
}

/// Import progress payload.
class ImportProgress {
  ImportProgress({
    required this.processedRows,
    this.totalRows,
    this.currentBatch,
  });

  final int processedRows;
  final int? totalRows;
  final int? currentBatch;
}

/// Summary returned after an import operation.
class ImportSummary {
  ImportSummary({
    required this.totalRows,
    required this.importedRows,
    required this.skippedRows,
    required this.errors,
  });

  final int totalRows;
  final int importedRows;
  final int skippedRows;
  final List<ExcelError> errors; // include row/column and message
}

/// Describes an error found in the Excel content (either during validation or import).
class ExcelError {
  ExcelError({
    required this.message,
    this.rowIndex,
    this.columnIndex,
    this.header,
  });

  final String message;
  final int? rowIndex; // 0-based data row index (not counting headers)
  final int? columnIndex; // 0-based column index
  final String? header; // optional header name involved
}
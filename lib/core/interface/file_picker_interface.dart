
/// Platform-agnostic file picker interface.
abstract class FilePickerInterface {
  /// Opens a file dialog and returns the selected file path, or empty string if cancelled.
  Future<String> pickFilePath({List<String> allowedExtensions = const []});

}

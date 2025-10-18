abstract class FileSaverInterface {
  Future<String> saveBytes({
    required List<int> bytes,
    required String suggestedFileName,
    String extension = 'xlsx',
  });
}

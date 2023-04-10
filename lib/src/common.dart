import 'dart:io';
import 'package:path_provider/path_provider.dart';

late Directory applicationDocumentsDirectory;

class Common {
  static Future<void> initialize() async {
    applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
  }
}
import 'package:logger/logger.dart';

  final logger = Logger();

  //for debug print
  dPrint(String text) {
    logger.d(text);
  }
  //for error print
  ePrint(String text) {
    logger.e(text);
  }

  //for info print
  iPrint(String text) {
    logger.i(text);
  }

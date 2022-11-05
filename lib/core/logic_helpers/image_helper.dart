import 'dart:io' as Io;
import 'dart:convert';


import '../utils/print.dart';


///Helper function if api require image to be a string
class ImageHelper {
  static Future<String> convertImageToBase64(
      {required String imagePath}) async {
    final bytes = await Io.File("image_path").readAsBytes();
    String result = base64Encode(bytes);
    iPrint("convertImageToBase64 $result");
    return result;
    //use result in its perspective field in the body(ex: "photo": result)
  }

}

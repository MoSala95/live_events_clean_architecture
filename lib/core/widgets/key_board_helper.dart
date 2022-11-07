import 'package:flutter/material.dart';

class KeyBoaredHelper {
  static void hidKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

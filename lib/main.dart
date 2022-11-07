import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './app.dart';
import './service_locator.dart';
import 'config/app_services/localization/localization_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const PhysiciansApp());
}

Future<void> init() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  serviceLocator();
  await LocalizationService().loadTranslationsFiles();
}

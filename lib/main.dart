import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_events_clean_architecture/core/app_global_services/localization_service.dart';
import './app.dart';
import './sevice_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  setupLocator();
  await LocalizationService().loadTranslationsFiles();

  runApp(const PhysiciansApp());
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/config/app/app_config.dart';

import 'config/app_services/localization/localization_service.dart';
import 'config/router/routes.dart';
import 'config/themes/app_theme_data.dart';

class PhysiciansApp extends StatelessWidget {
  const PhysiciansApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: AppConfig.appName,
            debugShowCheckedModeBanner: false,
            // localizationsDelegates: const [CupertinoLocalizationsDelegate()],
            fallbackLocale: LocalizationService.fallbackLocale,
            translations: LocalizationService(),
            theme: AppThemeData.lightTheme,
            // darkTheme: AppThemeData.darkTheme,
            initialRoute: Routes.mainEventsScreen,
            getPages: AppRouter.routes,
          );
        });
  }
}

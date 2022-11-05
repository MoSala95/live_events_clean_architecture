import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/app_config/app_config.dart';
import 'package:live_events_clean_architecture/core/app_global_services/localization_service.dart';
 import 'package:live_events_clean_architecture/router/routes_constants.dart';


 import 'core/ui_helpers/app_theme/app_theme_data.dart';
import 'router/router.dart';

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
            initialRoute: RoutesConstants.mainEventsScreen,
            getPages: AppRouter.routes,
          );
        });
  }
}

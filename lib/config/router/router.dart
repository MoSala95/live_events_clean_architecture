import 'package:get/get.dart';

import 'global_binding.dart';
import 'routes.dart';

class Routes {
  static const String mainEventsScreen = "/mainEventsScreen";
  static const String detailsEventsScreen = "/detailsEventsScreen";
}

class AppRouter {
  static final routes = [
    GetPage(
      name: Routes.mainEventsScreen,
      page: () => const MainEventsScreen(),
      binding: MainEventsBinding(),
      transition: Transition.fade,
    ),
  ];
}

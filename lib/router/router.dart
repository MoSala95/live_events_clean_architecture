import 'package:get/get.dart';
import 'package:live_events_clean_architecture/features/event/presentation/main_events/main_events_screen.dart';
import 'package:live_events_clean_architecture/router/global_binding.dart';
import 'package:live_events_clean_architecture/router/routes_constants.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: RoutesConstants.mainEventsScreen,
      page: () => const MainEventsScreen(),
      binding: MainEventsBinding(),
      transition: Transition.fade,
    ),

  ];
}
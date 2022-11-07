import 'package:get/get.dart';
import 'package:live_events_clean_architecture/features/event/presentation/main_events/main_events_controller.dart';

class MainEventsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainEventsController());
   }
}
import 'package:get/get.dart';

import '../controllers/set_reminder_controller.dart';

class SetReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetReminderController>(
      () => SetReminderController(),
    );
  }
}

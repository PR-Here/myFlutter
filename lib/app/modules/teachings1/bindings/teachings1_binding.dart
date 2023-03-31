import 'package:get/get.dart';

import '../controllers/teachings1_controller.dart';

class Teachings1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Teachings1Controller>(
      () => Teachings1Controller(),
    );
  }
}

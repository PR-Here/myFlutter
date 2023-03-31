import 'package:get/get.dart';

import '../controllers/teachings2_controller.dart';

class Teachings2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Teachings2Controller>(
      () => Teachings2Controller(),
    );
  }
}

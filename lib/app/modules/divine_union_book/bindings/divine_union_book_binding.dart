import 'package:get/get.dart';

import '../controllers/divine_union_book_controller.dart';

class DivineUnionBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DivineUnionBookController>(
      () => DivineUnionBookController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/inner_union_oracle_controller.dart';

class InnerUnionOracleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InnerUnionOracleController>(
      () => InnerUnionOracleController(),
    );
  }
}

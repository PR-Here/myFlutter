import 'package:get/get.dart';

import '../controllers/sessions_listing_controller.dart';

class SessionsListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionsListingController>(
      () => SessionsListingController(),
    );
  }
}

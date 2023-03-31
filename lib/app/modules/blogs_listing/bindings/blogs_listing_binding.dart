import 'package:get/get.dart';

import '../controllers/blogs_listing_controller.dart';

class BlogsListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogsListingController>(
      () => BlogsListingController(),
    );
  }
}

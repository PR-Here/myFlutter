import 'package:get/get.dart';

import '../controllers/books_listing_controller.dart';

class BooksListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BooksListingController>(
      () => BooksListingController(),
    );
  }
}

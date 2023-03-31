import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/retreats_testimonials_controller.dart';

class RetreatsTestimonialsView extends GetView<RetreatsTestimonialsController> {
  const RetreatsTestimonialsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RetreatsTestimonialsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RetreatsTestimonialsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

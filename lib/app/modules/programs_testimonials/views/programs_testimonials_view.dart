import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/programs_testimonials_controller.dart';

class ProgramsTestimonialsView extends GetView<ProgramsTestimonialsController> {
  const ProgramsTestimonialsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgramsTestimonialsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProgramsTestimonialsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

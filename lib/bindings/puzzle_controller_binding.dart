import 'package:get/get.dart';
import 'package:puzzle_hack/controllers/puzzle_controller.dart';

class PuzzleControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PuzzleController());
  }
}

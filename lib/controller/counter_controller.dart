import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  RxInt number = 0.obs;
  void inCrementNumber() async {
    number.value += 1;
    update();
  }

  void deCrementNumber() async {
    number.value -= 1;
    update();
  }
}

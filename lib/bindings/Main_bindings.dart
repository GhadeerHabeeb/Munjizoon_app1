import 'package:get/get.dart';
import 'package:munjizoon_app/MainScreen/Main_controller.dart';

class MainBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(MainController());

  }

}

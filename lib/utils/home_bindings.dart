import 'package:get/get.dart';
import 'package:movies/controller/details_controller.dart';
import 'package:movies/controller/movies_controller.dart';
import 'package:movies/controller/search_controller.dart';
import 'package:movies/controller/slash_screen_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.put(MoviesController());
    Get.lazyPut(() => DetailsController(), fenix: true);
    Get.lazyPut(() => MoviesSearchController(), fenix: true);
  }
}

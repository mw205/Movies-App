import 'package:get/get.dart';

import 'movies_controller.dart';

class DetailsController extends GetxController {
  late int index;
  late MoviesListType type;

  void setDetailsData(int currentIndex, MoviesListType listType) {
    index = currentIndex;
    type = listType;
  }
}

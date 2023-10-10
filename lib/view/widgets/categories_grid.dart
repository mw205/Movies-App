import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/details_controller.dart';
import 'package:movies/controller/movies_controller.dart';

class CategoriesGrid extends GetView<MoviesController> {
  final MoviesListType type;
  const CategoriesGrid({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final DetailsController detailsController = Get.find<DetailsController>();

    return GridView.builder(
      itemCount: 15,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            detailsController.setDetailsData(index, type);
            Get.toNamed("/details");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(138, 255, 255, 255),
              image: DecorationImage(
                image: NetworkImage(
                  controller.getPosterUrl(index, type),
                ),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        );
      },
    );
  }
}

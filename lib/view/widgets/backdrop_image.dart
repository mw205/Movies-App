import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/movies_controller.dart';
import 'package:movies/controller/search_controller.dart';
import 'package:movies/utils/constants.dart';

class BackDropImage extends StatelessWidget {
  const BackDropImage({
    super.key,
    required this.index,
    required this.type,
  });

  final int index;
  final MoviesListType type;

  @override
  Widget build(BuildContext context) {
    final MoviesController moviesController = Get.find<MoviesController>();
    final MoviesSearchController moviesSearchController =
        Get.find<MoviesSearchController>();
    return Container(
      width: w,
      height: h * 0.28,
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        image: DecorationImage(
          image: type == MoviesListType.search
              ? NetworkImage(
                  moviesSearchController.getBackdropImageUrl(index),
                )
              : NetworkImage(
                  moviesController.getBackdropImageUrl(index, type),
                ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

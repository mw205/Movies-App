import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/movies_controller.dart';
import 'package:movies/controller/search_controller.dart';
import 'package:movies/utils/constants.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({
    required this.type,
    super.key,
    required this.index,
  });

  final int index;
  final MoviesListType type;

  @override
  Widget build(BuildContext context) {
    final MoviesController moviesController = Get.find<MoviesController>();
    final MoviesSearchController moviesSearchController =
        Get.find<MoviesSearchController>();
    return Positioned(
      bottom: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: w * 0.04,
          ),
          Container(
            height: h * 0.2,
            width: isTablet ? w * 0.3 : w * 0.32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(69, 255, 255, 255),
              image: DecorationImage(
                image: type == MoviesListType.search
                    ? NetworkImage(
                        moviesSearchController.getPosterUrl(index)!,
                      )
                    : NetworkImage(
                        moviesController.getPosterUrl(index, type),
                      ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

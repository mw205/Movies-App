import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movies/controller/movies_controller.dart';
import 'package:movies/controller/search_controller.dart';
import 'package:movies/utils/constants.dart';

class RatingsIndicator extends StatelessWidget {
  const RatingsIndicator({
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
    return Positioned(
      right: 0,
      bottom: 0,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromARGB(165, 37, 40, 54)),
                height: h * 0.04,
                width: w * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.star_border_rounded,
                      color: Color(0xffFF8700),
                      size: 22.sp,
                    ),
                    type == MoviesListType.search
                        ? Text(
                            moviesSearchController
                                .getMovieAverageRating(index)!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : Text(
                            moviesController.getMovieAverageRating(
                                index, type)!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.11,
              )
            ],
          ),
          SizedBox(
            width: w * 0.025,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movies/controller/movies_controller.dart';
import 'package:movies/controller/search_controller.dart';
import 'package:movies/utils/constants.dart';

class MovieName extends StatelessWidget {
  const MovieName({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: w * 0.38,
        ),
        Flexible(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.3,
              ),
              type == MoviesListType.search
                  ? Text(
                      moviesSearchController.getMovieName(index)!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 15.sp : 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Text(
                      moviesController.getMovieName(index, type)!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 15.sp : 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movies/controller/details_controller.dart';
import 'package:movies/controller/movies_controller.dart';
import 'package:movies/controller/search_controller.dart';
import 'package:movies/utils/constants.dart';

import 'widgets/backdrop_image.dart';
import 'widgets/movie_name_widget.dart';
import 'widgets/poster_image.dart';
import 'widgets/ratings_indicator.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final DetailsController detailsController = Get.find<DetailsController>();
    final MoviesController moviesController = Get.find<MoviesController>();
    final MoviesSearchController searchController =
        Get.find<MoviesSearchController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 18.sp,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.38,
                child: Stack(
                  children: [
                    MovieName(
                        index: detailsController.index,
                        type: detailsController.type),
                    BackDropImage(
                        index: detailsController.index,
                        type: detailsController.type),
                    PosterImage(
                        index: detailsController.index,
                        type: detailsController.type),
                    RatingsIndicator(
                        index: detailsController.index,
                        type: detailsController.type),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: detailsController.type == MoviesListType.search
                        ? Text(
                            "${searchController.getMovieDate(detailsController.index)}   |   ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          )
                        : Text(
                            "${moviesController.getMovieDate(detailsController.index, detailsController.type)}   |   ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                  ),
                  Icon(
                    Icons.groups_2_rounded,
                    color: Colors.grey,
                    size: 25.sp,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: detailsController.type == MoviesListType.search
                        ? Text(
                            "${searchController.getMoviePopularity(detailsController.index)} ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          )
                        : Text(
                            "${moviesController.getMoviePopularity(detailsController.index, detailsController.type)} ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Overview",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
              Divider(
                height: 20,
                thickness: 2,
                color: Colors.grey,
                indent: 10.sp,
                endIndent: 250.sp,
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Flexible(
                    child: detailsController.type == MoviesListType.search
                        ? Text(
                            searchController
                                .getMovieOverview(detailsController.index),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),
                          )
                        : Text(
                            moviesController.getMovieOverview(
                                detailsController.index,
                                detailsController.type),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

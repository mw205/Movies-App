import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/controller/details_controller.dart';
import 'package:movies/controller/movies_controller.dart';
import 'package:movies/controller/search_controller.dart';

import '../utils/constants.dart';
import 'widgets/search_field.dart';

class SearchPage extends GetView {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MoviesSearchController searchController =
        Get.find<MoviesSearchController>();
    final DetailsController detailsController = Get.find<DetailsController>();
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          "Search",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              const Center(child: SearchFeild()),
              searchController.count.value == 0
                  ? LottieBuilder.asset(
                      "assets/images/no_results.json",
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: searchController
                            .moviesData.value!.moviesList!.length,
                        itemBuilder: (context, itemIndex) {
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0, vertical: 12),
                                child: GestureDetector(
                                  onTap: () {
                                    detailsController.setDetailsData(
                                        itemIndex, MoviesListType.search);
                                    Get.toNamed("/details");
                                  },
                                  child: Container(
                                    height: h * 0.18,
                                    width: isTablet ? w * 0.2 : w * 0.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: const Color.fromARGB(
                                          69, 255, 255, 255),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          searchController
                                              .getPosterUrl(itemIndex)!,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: SizedBox(
                                    height: h * 0.2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          searchController
                                              .getMovieName(itemIndex)!,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.calendar_today_outlined,
                                              color: Colors.grey,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                "${searchController.getMovieDate(itemIndex)} ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.grey,
                                              size: 25.sp,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                "${searchController.getMovieAverageRating(itemIndex)} ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

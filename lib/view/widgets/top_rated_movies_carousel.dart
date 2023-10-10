import 'package:bordered_text/bordered_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/controller/movies_controller.dart';

import '../../controller/details_controller.dart';
import '../../utils/constants.dart';

class TopRatedMoviesCarousel extends GetView<MoviesController> {
  const TopRatedMoviesCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DetailsController detailsController = Get.find<DetailsController>();

    return CarouselSlider.builder(
      itemCount: 10,
      options: CarouselOptions(
        height: 0.1 * h,
        autoPlay: true,
        viewportFraction: isTablet ? 0.38 : 0.5,
        reverse: false,
        disableCenter: true,
      ),
      itemBuilder: (context, itemIndex, realIndex) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                detailsController.setDetailsData(
                    itemIndex, MoviesListType.topRated);
                Get.toNamed('/details');
              },
              child: Container(
                height: h * 0.245,
                width: isTablet ? w * 0.3 : w * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(69, 255, 255, 255),
                  image: DecorationImage(
                    image: NetworkImage(
                      controller.getPosterUrl(
                          itemIndex, MoviesListType.topRated),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: BorderedText(
                strokeColor: const Color(0xff0296E5),
                strokeWidth: 1.5,
                child: Text(
                  "${itemIndex + 1}",
                  style: GoogleFonts.montserrat(
                    color: scaffoldColor,
                    fontWeight: FontWeight.w500,
                    fontSize: isTablet ? 85.sp : 90.sp,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

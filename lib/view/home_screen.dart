import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/utils/constants.dart';

import 'widgets/categories_tabs.dart';
import 'widgets/search_bar.dart';
import 'widgets/top_rated_movies_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: h * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What do you want to watch?",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                const Center(
                  child: HomeSearchBar(),
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                const Flexible(
                  fit: FlexFit.tight,
                  child: TopRatedMoviesCarousel(),
                ),
                const CategoriesTabs(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

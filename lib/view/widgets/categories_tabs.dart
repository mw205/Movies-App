import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/controller/movies_controller.dart';
import 'package:movies/utils/constants.dart';

import 'categories_grid.dart';

class CategoriesTabs extends StatelessWidget {
  const CategoriesTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            dividerColor: Colors.white.withOpacity(0),
            indicatorColor: const Color(0xff3A3F47),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorPadding: isTablet
                ? const EdgeInsetsDirectional.only(top: 45)
                : const EdgeInsets.all(0),
            labelStyle: TextStyle(fontSize: 15.sp),
            tabs: const [
              Tab(
                text: 'Upcoming',
              ),
              Tab(
                text: 'Top rated',
              ),
              Tab(
                text: 'Popular',
              ),
            ],
          ),
          SizedBox(
            height: h * 0.41,
            child: const TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CategoriesGrid(
                    type: MoviesListType.upcoming,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CategoriesGrid(
                    type: MoviesListType.topRated,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CategoriesGrid(
                    type: MoviesListType.popular,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

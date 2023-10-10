import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movies/utils/constants.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/search");
      },
      child: Container(
        height: h * 0.065,
        width: (w * 0.9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff3A3F47),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search",
                style:
                    TextStyle(color: const Color(0xff67686D), fontSize: 14.sp),
              ),
              SizedBox(
                child: Transform.scale(
                  scale: 1.2,
                  child: SvgPicture.asset("assets/images/Search.svg"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

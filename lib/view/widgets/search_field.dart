import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movies/controller/search_controller.dart';
import 'package:movies/utils/constants.dart';

class SearchFeild extends GetView<MoviesSearchController> {
  const SearchFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xff3A3F47),
        borderRadius: BorderRadius.circular(16),
      ),
      width: (w * 0.9),
      child: TextField(
        controller: controller.textEditingController,
        style: TextStyle(color: Colors.white, fontSize: 15.sp),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: const Color(0xff67686D), fontSize: 14.sp),
          suffixIcon: SizedBox(
            child: Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset("assets/images/Search.svg"),
            ),
          ),
        ),
      ),
    );
  }
}

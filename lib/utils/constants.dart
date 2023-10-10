import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color scaffoldColor = const Color(0xff1E1E1E);
final mediaQuery = Get.mediaQuery;
const String primFontFamily = "poppins";

final w = mediaQuery.size.width;
final h = mediaQuery.size.height;
bool isTablet = mediaQuery.size.shortestSide >= 600;

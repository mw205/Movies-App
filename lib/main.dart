import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movies/utils/home_bindings.dart';
import 'package:movies/view/details.dart';
import 'package:movies/view/home_screen.dart';
import 'package:movies/view/search.dart';
import 'package:movies/view/splash_screen.dart';

import 'utils/constants.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: scaffoldColor,
            appBarTheme: AppBarTheme(color: scaffoldColor),
            useMaterial3: true,
            fontFamily: primFontFamily,
            textSelectionTheme: const TextSelectionThemeData(
              selectionHandleColor: Color.fromARGB(0, 255, 255, 255),
            ),
          ),
          initialBinding: HomeBindings(),
          home: const SplashScreen(),
          getPages: [
            GetPage(name: "/", page: () => const SplashScreen()),
            GetPage(name: "/Home", page: () => const HomePage()),
            GetPage(name: "/details", page: () => const MovieDetails()),
            GetPage(name: "/search", page: () => const SearchPage()),
          ],
        );
      },
    );
  }
}

import 'package:get/get.dart';
import 'package:halalin/app/modules/detail_ecode/bindings/detail_ecode_binding.dart';
import 'package:halalin/app/modules/detail_ecode/views/detail_ecode_view.dart';
import 'package:halalin/app/modules/detail_news/views/detail_news_view.dart';
import 'package:halalin/app/modules/main/views/tabs/explore/bindings/explore_binding.dart';
import 'package:halalin/app/modules/main/views/tabs/explore/views/explore_view.dart';
import 'package:halalin/app/modules/main/views/tabs/news/bindings/news_binding.dart';
import 'package:halalin/app/modules/main/views/tabs/news/views/news_view.dart';
import 'package:halalin/app/modules/search_ecode/bindings/search_ecode_binding.dart';
import 'package:halalin/app/modules/search_ecode/views/search_ecode_view.dart';
import 'package:halalin/app/modules/search_product/bindings/search_product_controller.dart';
import 'package:halalin/app/modules/search_product/views/search_product_view.dart';

import '../modules/main/views/tabs/about/bindings/about_binding.dart';
import '../modules/main/views/tabs/about/views/about_view.dart';
import '../modules/detail_product/bindings/detail_product_binding.dart';
import '../modules/detail_product/views/detail_product_view.dart';
import '../modules/detail_result/bindings/detail_result_binding.dart';
import '../modules/detail_result/views/detail_result_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/main/views/tabs/bookmark/bindings/bookmark_binding.dart';
import '../modules/main/views/tabs/bookmark/views/bookmark_view.dart';
import '../modules/main/views/tabs/home/bindings/home_binding.dart';
import '../modules/main/views/tabs/home/views/home_view.dart';
import '../modules/main/views/tabs/ocr/bindings/ocr_binding.dart';
import '../modules/main/views/tabs/ocr/views/ocr_view.dart';
import '../modules/result/bindings/result_binding.dart';
import '../modules/result/views/result_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/view/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => SplashScreenView(),
        binding: SplashScreenBinding()),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => const ResultView(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: _Paths.OCR,
      page: () => OcrView(),
      binding: OcrBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RESULT,
      page: () => const DetailResultView(),
      binding: DetailResultBinding(),
    ),
    GetPage(
      name: _Paths.BOOKMARK,
      page: () => const BookmarkView(),
      binding: BookmarkBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => const DetailProductView(),
      binding: DetailProductBinding(),
    ),
    GetPage(
      name: _Paths.NEWS, 
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE, 
      page: () => ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_NEWS,
      page: () => DetailNewsView(),
      binding: NewsBinding()
    ),
    GetPage(
      name: _Paths.SEARCH_PRODUCT, 
      page: () => SearchProductView(),
      binding: SearchProductBinding()
    ),
    GetPage(
      name: _Paths.SEARCH_ECODE,
      page: () => SearchEcodeView(),
      binding: SearchEcodeBinding()),
    GetPage(
        name: _Paths.DETAIL_ECODE,
        page: () => DetailEcodeView(),
        binding: DetailEcodeBinding()),
  ];
}

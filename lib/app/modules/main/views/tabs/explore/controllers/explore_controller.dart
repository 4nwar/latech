import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/explore.dart';
import 'package:halalin/app/routes/app_pages.dart';

class ExploreController extends GetxController {
  List<Explore> explore = [
    Explore(kat: "Article",img: expArticle,),
    Explore(kat: "Product", img: expProduct),
    Explore(kat: "E-Code", img: expEcode)
  ];

  void navigateToExplorePage(String exploreType) {
    switch (exploreType) {
      case "Article":
        Get.toNamed(Routes.NEWS);
        break;
      case "Product":
        Get.toNamed(Routes.BOOKMARK); //ubah ke sebenar
        break;
      case "E-Code":
        Get.toNamed(Routes.ABOUT); //ubah ke sebenar
        break;
      default:
        // Tindakan default jika tipe tidak dikenali
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

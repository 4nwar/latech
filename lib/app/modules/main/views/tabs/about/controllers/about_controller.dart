import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/team.dart';

class AboutController extends GetxController {
  //TODO: Implement AboutController

  final count = 0.obs;

  List<Team> teamList = [
    Team(
        nama: "Krisna Maulana",
        bagian: "Data Engineer",
        gambar: krisnaPhotoProfile),
    Team(
        nama: "Thoriq Harizul A.",
        bagian: "Software Engineer",
        gambar: thoriqPhotoProfile),
    Team(
        nama: "Nor Mohammad A.S",
        bagian: "UI / UX Designer",
        gambar: sadadPhotoProfile),
    Team(
        nama: "Dicky Arya Pratama",
        bagian: "Software Engineer",
        gambar: dickyPhotoProfile),
  ];

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

  void increment() => count.value++;
}

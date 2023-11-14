// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/data/models/NewsItem.dart';
import 'package:halalin/app/modules/detail_news/controllers/detail_news_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constant/values.dart';
import '../../../data/models/News_detail.dart';

class DetailNewsView extends GetView<DetailNewsController> {
  const DetailNewsView({Key? key});

  @override
  Widget build(BuildContext context) {
    final DetailNewsController controller = Get.put(DetailNewsController());
    // Dapatkan objek NewsItem dari argumen
    NewsItem newsItem = Get.arguments;

    // Panggil metode untuk memuat detail data
    controller.fetchDetailData(newsItem.url);

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          // Tampilkan indikator loading jika sedang memuat data
          return Center(child: CircularProgressIndicator());
        } else if (controller.detailNewslist.isNotEmpty) {
          // Tampilkan tampilan detail berita jika data sudah tersedia
          NewsDetailModel detail = controller.detailNewslist[0];

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    newsItem.img,
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                expandedHeight: getDeviceHeight(context) * 0.3,
              ),
              SliverFillRemaining(
                child: Container(
                  padding: EdgeInsets.only(right: 8, left: 8, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsItem.title,
                        style: textCustom(
                            semiBoldFont, 16, Colors.black.withOpacity(0.85)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(newsItem.category,
                                  style:
                                      textCustom(mediumFont, 12, Colors.white)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () async {
                                await controller.updateSaveDataBookmarkNews();
                              },
                              icon: Obx(() {
                                if (controller.detailNewslist.isNotEmpty) {
                                  bool isBookmarked =
                                      controller.isBookmarked.value;

                                  return Icon(
                                    isBookmarked
                                        ? Iconsax.archive_add5
                                        : Iconsax.archive_add,
                                    size: 24,
                                    color:
                                        isBookmarked ? Colors.green : primary,
                                  );
                                } 
                                else {
                                  return Icon(Iconsax.happyemoji4,
                                      size: 24, color: primary);
                                }
                              }),
                            ),
                          ),

                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(children: [
                              Icon(
                                Iconsax.calendar_tick,
                                size: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                detail.date,
                                style: textCustom(mediumFont, 14, Colors.grey),
                              )
                            ]),
                            SizedBox(width: 20),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.profile_circle,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  detail.writer,
                                  style:
                                      textCustom(mediumFont, 14, Colors.grey),
                                )
                              ],
                            ),
                          ]),
                      Expanded(
                        child: Html(data: detail.content),
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          // Tampilkan pesan jika tidak ada data yang tersedia
          return Center(child: Text('No data available'));
        }
      }),
    );
  }
}

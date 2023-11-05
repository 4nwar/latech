import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/NewsItem.dart';
import 'package:halalin/app/data/models/News_detail.dart';
import 'package:halalin/app/modules/detail_news/controllers/detail_news_controller.dart';
import 'package:iconsax/iconsax.dart';

class DetailNewsView extends GetView<DetailNewsController> {
  const DetailNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    //disini get news argumen
    NewsItem newsItem = Get.arguments;
    // final DetailNewsController controller = Get.find();
    Get.put(DetailNewsController());
    String newsDetailUrl = newsItem.url;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //ini appbar
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                // "https://halalmui.org/wp-content/uploads/2023/08/logo-lppommui-low-300x225.jpg",
                newsItem.img,
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: getDeviceHeight(context) * 0.3,
          ),
          //inni body
          SliverFillRemaining(
            // child: newsDetailSection(),
            child: Container(
              padding: EdgeInsets.only(right: 8, left: 8, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "ini Judul",
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
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                              // "News",
                              newsItem.category,
                              style: textCustom(mediumFont, 12, Colors.white)),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Iconsax.archive_add,
                              size: 24,
                              color: primary,
                            ),
                          ))
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
                          // detail.date,
                          "October, 20 2000",
                          style: textCustom(mediumFont, 16, Colors.grey),
                        )
                      ]),
                      SizedBox(width: 20),
                      Row(children: [
                        Icon(
                          Iconsax.profile_circle,
                          size: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Yana",
                          // detail.writer,
                          style: textCustom(mediumFont, 16, Colors.grey),
                        )
                      ]),
                    ],
                  ),
                  //tambhakan dependencies html
                  Expanded(child: Html(data: "detail.content"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //ini untuk widget section isinya

  // Widget newsDetailSection(NewsDetailModel detail) {
  //   return Container(
  //     padding: EdgeInsets.only(right: 8, left: 8, top: 20),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           "ini Judul",
  //           style: textCustom(semiBoldFont, 16, Colors.black.withOpacity(0.85)),
  //         ),
  //         row1(detail),
  //         row2(detail),

  //         //tambhakan dependencies html
  //         Expanded(child: Html(data: detail.content))
  //       ],
  //     ),
  //   );
  // }

  // Widget row1(NewsDetailModel detail) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Align(
  //         alignment: Alignment.topLeft,
  //         child: Container(
  //           padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
  //           decoration: BoxDecoration(
  //             color: Colors.lightGreen,
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Text("News", //ini ubah sesuai api
  //               style: textCustom(mediumFont, 12, Colors.white)),
  //         ),
  //       ),
  //       Align(
  //           alignment: Alignment.topRight,
  //           child: IconButton(
  //             onPressed: () {},
  //             icon: Icon(
  //               Iconsax.archive_add,
  //               size: 24,
  //               color: primary,
  //             ),
  //           ))
  //     ],
  //   );
  // }

  // Widget row2(NewsDetailModel detail) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Row(children: [
  //         Icon(
  //           Iconsax.calendar_tick,
  //           size: 20,
  //           color: Colors.grey,
  //         ),
  //         SizedBox(width: 4),
  //         Text(
  //           detail.date,
  //           // "October, 20 2000",
  //           style: textCustom(mediumFont, 16, Colors.grey),
  //         )
  //       ]),
  //       SizedBox(width: 20),
  //       Row(children: [
  //         Icon(
  //           Iconsax.profile_circle,
  //           size: 20,
  //           color: Colors.grey,
  //         ),
  //         SizedBox(width: 4),
  //         Text(
  //           // "Yana",
  //           detail.writer,
  //           style: textCustom(mediumFont, 16, Colors.grey),
  //         )
  //       ]),
  //     ],
  //   );
  // }
}

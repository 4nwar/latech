import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/routes/app_pages.dart';
import 'package:iconsax/iconsax.dart';

import '../data/models/NewsItem.dart';

class NewsCardWidget extends StatelessWidget {

  final NewsItem newsItem;

  const NewsCardWidget({required this.newsItem, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 4, right: 4, top: 8),
        child: Card(
          elevation: 0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(16)),
          child: new InkWell(
            onTap: () {
              Get.toNamed(Routes.DETAIL_NEWS, arguments: newsItem);
            },
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    new ClipRRect(
                      // child: Image.asset(
                      //   newsItem.img,
                      //   // "https://halalmui.org/wp-content/uploads/2023/08/logo-lppommui-low-300x225.jpg", // ini akan di ubah sesuai dengan img api
                      //   fit: BoxFit.cover,
                      //   width: getDeviceWidth(context),
                      //   height: getDeviceHeight(context) * 0.25,
                      // ),
                      child: FadeInImage.assetNetwork(
                        //ubah place holder dengan img yang sesuaai
                        placeholder: thumbNews,
                        image: newsItem.img,
                        fit: BoxFit.cover,
                        width: getDeviceWidth(context),
                        height: getDeviceHeight(context) * 0.25,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: new Radius.circular(16),
                          topRight: new Radius.circular(16)),
                    ),
                    Container(
                      height: getDeviceHeight(context) *
                          0.25, // Sesuaikan dengan tinggi gambar
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(
                                0.7), // Ubah sesuai warna gradien yang Anda inginkan
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          margin: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            newsItem.category,
                            // "News", //ini ubah sesuai api
                              style: textCustom(mediumFont, 12, Colors.white)),
                        )),
                    //dibawah ini sebenarnya ada tombol untuk archive
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       Iconsax.archive_add,
                    //       size: 24,
                    //       color: primary,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                new Padding(
                  padding: new EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: new Text(
                    newsItem.title,
                    // "Ministry of Cooperatives and SMEs of The Republic of Indonesia: Indonesia Ranked Second in Halal Industrial Products Consumption Trends", //ini judul dari api
                    style: textCustom(
                        semiBoldFont, 16, Colors.black.withOpacity(0.85)
                    ),
                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // child: new Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     new Text(
                  //       "ini judul", //ini judul dari api
                  //       style: textCustom(
                  //           semiBoldFont, 16, Colors.black.withOpacity(0.85)),
                  //     ),
                  //   ],
                  // ),
                )
              ],
            ),
          ),
        ));
  }
}

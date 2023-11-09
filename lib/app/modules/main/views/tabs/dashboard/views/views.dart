import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/main/views/tabs/dashboard/controllers/dashboard_controller.dart';
import 'package:halalin/app/routes/app_pages.dart';

import '../../../../../../ui/ecodeCard_widget.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    final ecodeList = controller.ecodeList;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          headline,
          scale: 0.4,
          fit: BoxFit.contain,
          height: 500,
        ),
        backgroundColor: primary,
        centerTitle: true,
      ),
      body: ListView(
        // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          //carousel
          // tombol
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(

          //     )
          //   ],
          // ),
          //ecode
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ecode",
                    style: textCustom(mediumFont, 20, Colors.black),
                  ),
                  InkWell(
                    child: Text(
                      "See more",
                      style: textCustom(regularFont, 12, Colors.black),
                    ),
                    onTap: () {
                      Get.toNamed(Routes.SEARCH_ECODE);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(child: Obx((() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final ecodeList = controller.ecodeList;
                  return Container(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        // Tampilkan hasil pencarian di sini
                        return SizedBox(
                          height: 160,
                          child: buildEcodeCard(ecodeList[index], context),
                        );
                      },
                    ),
                  );
                }
              })))
            ],
          ),
          // // article
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Category Article",
                    style: textCustom(mediumFont, 20, Colors.black),
                  ),
                  InkWell(
                    child: Text(
                      "See more",
                      style: textCustom(regularFont, 12, Colors.black),
                    ),
                    onTap: () {
                      Get.toNamed(Routes.NEWS);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: getDeviceHeight(context) * 0.18,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.thumbnail.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  controller.thumbnail[index].img,
                                  fit: BoxFit.cover,
                                  width: getDeviceWidth(context) * 0.6,
                                  height: getDeviceHeight(context) * 0.18,
                                ),
                              ),
                              Container(
                                height: getDeviceHeight(context) * 0.18,
                                width: getDeviceWidth(context),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Color.fromRGBO(40, 40, 40, 0.6),
                                          Colors.transparent
                                        ])),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    margin: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      controller.thumbnail[index].cat,
                                        style:
                                            textCustom(mediumFont, 12, Colors.white)
                                      ),
                                    )
                                ),
                                Positioned(
                                  left: 12,
                                  bottom: 12,
                                  child: Text(
                                    controller.thumbnail[index].txt,
                                    maxLines: 4,
                                  )
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          //bottom banner
          SizedBox(
              width: getDeviceWidth(context),
              child: Image.asset(
                bannerBottom,
                fit: BoxFit.fitWidth,
              ))
        ],
      ),
    );
  }
}

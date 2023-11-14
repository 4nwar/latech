import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/main/views/tabs/dashboard/controllers/dashboard_controller.dart';
import 'package:halalin/app/routes/app_pages.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    controller.ThumbEcode();

    Color cardColor;
    Color statusColor;

    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //appbar space
                  SizedBox(height: 100),
                  //banner
                  Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: ListView(
                      children: [
                        CarouselSlider( 
                          options: CarouselOptions(
                            height: 150,
                            viewportFraction: 1,
                            autoPlay: true,
                            pauseAutoPlayInFiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 3),
                            
                          ),
                          items:  [
                            //gambar 1
                            Container(
                              // height: 100,
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage(banner1),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              // height: 100,
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage(banner2),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              // height: 100,
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage(banner3),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 4,
                        // )
                      ],
                    ),
                  ),
                  

                  //buttonSection
                  Container(
                    height: 200,
                    // margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.SEARCH_PRODUCT);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green.shade400,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: getDeviceWidth(context) * 0.2,
                                      margin: EdgeInsets.all(4),
                                      child: Image.asset(thumbExplore, scale: 0.6,),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Search Product",
                                      style: textCustom(
                                          semiBoldFont, 12, Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.OCR);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green.shade700,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: getDeviceWidth(context) * 0.2,
                                      margin: EdgeInsets.all(4),
                                      child: Image.asset(thumbScan, scale: 0.8,),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Scan Product",
                                      style: textCustom(
                                          semiBoldFont, 12, Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //EcodeSection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 12, bottom: 4),
                        child: Text(
                          "E-Code",
                          style: textCustom(mediumFont, 20, Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 12,bottom: 4),
                        child: InkWell(
                          child: Text(
                            "See more",
                            style: textCustom(regularFont, 12, Colors.black),
                          ),
                          onTap: () {
                            Get.toNamed(Routes.SEARCH_ECODE);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 160,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else if (controller.ecodeList.isNotEmpty) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            switch (controller.ecodeList[index].status
                                .toLowerCase()) {
                              case "syubhat":
                                cardColor = Colors.amber.shade100;
                                statusColor = Colors.amber.shade400;
                                break;
                              case "halal":
                                cardColor = Colors.green.shade100;
                                statusColor = Colors.green.shade400;
                                break;
                              default:
                                cardColor = Colors.red.shade100;
                                statusColor = Colors.red.shade400;
                                break;
                            }

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: getDeviceWidth(context) * 0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: cardColor,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        ornamentEcode,
                                        fit: BoxFit.cover,
                                        width: getDeviceWidth(context) * 0.9,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.ecodeList[index].name,
                                            style:
                                                const TextStyle(fontSize: 16),
                                            maxLines: 1,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            controller.ecodeList[index].id,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 16),
                                            decoration: BoxDecoration(
                                              color: statusColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              controller
                                                  .ecodeList[index].status,
                                              style: textCustom(
                                                  mediumFont, 14, Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Text("Tidak ada data Ecode.");
                      }
                    }),
                  ),
                  //ArticleSection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 12,bottom: 4),
                        child: Text(
                          "Category Article",
                          style: textCustom(mediumFont, 20, Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 12,bottom: 4),
                        child: InkWell(
                          child: Text(
                            "See more",
                            style: textCustom(regularFont, 12, Colors.black),
                          ),
                          onTap: () {
                            Get.toNamed(Routes.NEWS);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    height: getDeviceHeight(context) * 0.24,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.thumbnail.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    controller.thumbnail[index].img,
                                    fit: BoxFit.cover,
                                    width: getDeviceWidth(context) * 0.8,
                                    height: getDeviceHeight(context) * 0.24,
                                  ),
                                ),
                                Container(
                                  height: getDeviceHeight(context) * 0.24,
                                  width: getDeviceWidth(context) * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Color.fromRGBO(40, 40, 40, 0.9),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
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
                                      style: textCustom(
                                          mediumFont, 12, Colors.white),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 12,
                                  bottom: 12,
                                  right: 12,
                                  child: Text(
                                    controller.thumbnail[index].txt,
                                    maxLines: 4,
                                    style: textCustom(
                                        regularFont, 12, Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //BottomBannerSection
                  SizedBox(
                    width: getDeviceWidth(context),
                    child: Image.asset(
                      bannerBottom,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Appbar
          Container(
            color: primary,
            width: getDeviceWidth(context),
            height: 100,
            child: Container(
              margin: EdgeInsets.all(12),
              child: Image.asset(
                headline,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

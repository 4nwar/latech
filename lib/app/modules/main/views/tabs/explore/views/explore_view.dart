import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/explore.dart';
import 'package:halalin/app/modules/main/views/tabs/explore/controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ExploreController());
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          snap: false,
          pinned: false,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: Text(
              "Explore",
              style: textCustom(FontWeight.w500, 16, Colors.white),
              textAlign: TextAlign.start,
            ),
            background: Image.asset(
              exploreHeader,
              fit: BoxFit.fitHeight,
            ),
          ),
          expandedHeight: getDeviceHeight(context) * 0.22,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, top: 8),
              child: Card(
                elevation: 0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10)),
                child: new InkWell(
                  onTap: () {
                    controller.navigateToExplorePage(controller.explore[index].kat);
                    // ini nanti idi arahin ke pagenya
                    print(controller.explore[index].kat);
                  },
                  child: new Stack(
                    children: [
                      new ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          controller.explore[index].img,
                          fit: BoxFit.cover,
                          width: getDeviceWidth(context),
                          height: getDeviceHeight(context) * 0.18,
                        ),
                        // borderRadius: BorderRadius.circular(16),
                      ),
                      Container(
                        height: getDeviceHeight(context) * 0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Colors.transparent,
                                  Color.fromRGBO(40, 40, 40, 0.6),
                                ])),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child:Column(
                      //     children: [
                      //       Text(
                      //         controller.explore[index].kat,
                      //         style: textCustom(boldFont, 16, Colors.white),
                      //       ),
                      //       Text(
                      //         "see More",
                      //         style: textCustom(thinFont, 12, Colors.white),
                      //       )
                      //     ],
                      //   )
                      // )
                      Positioned(
                          bottom: 20,
                          left: 20,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.explore[index].kat,
                                style: textCustom(boldFont, 30, Colors.white),
                              ),
                              Text(
                                "see More",
                                style: textCustom(mediumFont, 12, Colors.white),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: controller.explore.length,
        ))
      ],
    );
  }
}

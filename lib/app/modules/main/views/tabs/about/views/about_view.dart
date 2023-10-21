import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AboutController());
    List<Widget> sliverList() {
      Widget apbbar = SliverAppBar(
          backgroundColor: primary,
          pinned: true,
          floating: false,
          snap: false,
          shape: appBarShape(),
          flexibleSpace: appBarBackground(),
          bottom: appBarBottom(context),
          expandedHeight: getDeviceHeight(context) * 0.32);

      Widget body = SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 340.0,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 0.95,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            // return Container(
            //   color: primary,
            //   child: Text(products[index].nama),
            // );
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
              child: Container(
                  color: primaryAccentVariant,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                            width: getDeviceWidth(context),
                            // color: primary,
                            decoration: BoxDecoration(
                                color: primary, shape: BoxShape.circle),
                            child: Center(
                                child: Image.asset(
                                    controller.teamList[index].gambar))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          controller.teamList[index].nama,
                          style: textCustom(FontWeight.w500, 12, Colors.black),
                        ),
                      ),
                      Text(
                        "(${controller.teamList[index].bagian})",
                        style: textCustom(FontWeight.w500, 12, Colors.black),
                      )
                    ],
                  )),
            );
          },
          childCount: controller.teamList.length,
        ),
      );

      List<Widget> sliver = [];

      sliver.add(apbbar);
      sliver.add(body);

      return sliver;
    }

    return Scaffold(
        backgroundColor: primaryAccentVariant,
        body: CustomScrollView(
          slivers: sliverList(),
        ));
  }

  ShapeBorder appBarShape() {
    return const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)));
  }

  Widget appBarBackground() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Image.asset(
              ornamentAboutLeft,
              scale: 1.2,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(ornamentAboutRight),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Image.asset(
                    logo,
                    scale: 2.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Scan Your",
                    style: textCustom(FontWeight.w700, 16, primaryAccent),
                  ),
                ),
                Text(
                  "FOODS",
                  style: textCustom(FontWeight.w700, 18, primaryAccent),
                ),
                Text(
                  "For Better Life",
                  style: textCustom(FontWeight.w600, 14, primaryAccent),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Latech Apps is a multiplatform application \nthat can help us in ensuring the halalness \nof food products based on ingredients",
                    style: textCustom(FontWeight.w500, 13, primaryAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
        // Align(alignment: Alignment.center, child: Image.asset(headline, scale: 4,),),
      ],
    );
  }

  PreferredSize appBarBottom(context) {
    double height = getDeviceHeight(context) * 0.28;
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Transform.translate(
          offset: const Offset(0, 24),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 100,
                  color: primaryVariant,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Our team",
                      textAlign: TextAlign.center,
                      style: textCustom(FontWeight.w400, 12, Colors.black),
                    ),
                  ),
                ),
              ))),
    );
  }
}

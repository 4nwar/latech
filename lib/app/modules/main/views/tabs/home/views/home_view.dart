import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/routes/app_pages.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.put(HomeController());

    return Scaffold(
        backgroundColor: primaryAccentVariant,
        body: Obx(() {
          return CustomScrollView(slivers: [
            SliverAppBar(
                backgroundColor: primary,
                pinned: true,
                floating: false,
                snap: false,
                shape: appBarShape(),
                actions: [
                  InkWell(
                    child: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.ABOUT);
                        },
                        icon: const Icon(Iconsax.info_circle)),
                  )
                ],
                flexibleSpace: appBarBackground(),
                bottom: appBarBottom(context),
                expandedHeight: getDeviceHeight(context) * 0.26),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Halal Food",
                        style: textCustom(semiBoldFont, 20, Colors.black)),
                    Text(
                      "Foods with no pork or alcohol",
                      style: textMediumDefault,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return SizedBox(
                      height: 500,
                      width: 500,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.DETAIL_PRODUCT,
                            arguments: controller.products[index],
                          );
                        },
                        child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 3.0,
                            shape: const ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Text(
                                      controller.products[index].nama,
                                      maxLines: 1,
                                      style: textMediumDefault,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 500,
                                    child: Image.network(
                                        controller.products[index].gambar,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: primary,
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Center(
                                                  child: Image.asset(
                                                    foodIcon,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                )),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                      begin: Alignment(0, 0),
                                      end: Alignment(0, 2),
                                      colors: [
                                        Color(0x00ffffff),
                                        Colors.black,
                                      ],
                                    )),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      onPressed: () async {
                                        if (c.products[index].is_bookmark
                                                .toLowerCase() ==
                                            'true') {
                                          c.products[index].is_bookmark =
                                              'false';
                                        } else {
                                          c.products[index].is_bookmark =
                                              'true';
                                        }
                                        ;
                                        c.products.refresh();
                                        c.updateSaveDataBookmarkProduct();
                                      },
                                      icon: Icon(
                                        (controller.products[index].is_bookmark
                                                    .toLowerCase() ==
                                                'true')
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                        size: 24,
                                        color: primary,
                                      )),
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                  childCount: controller.products.length,
                ),
              ),
            )
          ]);
        }));
  }

  ShapeBorder appBarShape() {
    return const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)));
  }

  Widget appBarBackground() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: Image.asset(
          headline,
          scale: 3.8,
        )),
        // Align(alignment: Alignment.center, child: Image.asset(headline, scale: 4,),),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            ornamentAppbarLeft,
            scale: 1.2,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(ornamentAppbarRight),
        ),
      ],
    );
  }

  PreferredSize appBarBottom(context) {
    double height = getDeviceHeight(context) * 0.02;
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Transform.translate(
          offset: const Offset(0, 24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: (value) {
                controller.searchProduct(query: value);
              },
              cursorColor: primary,
              style: textRegularDefault,
              maxLines: 1,
              maxLength: 40,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Iconsax.search_normal,
                  color: primary,
                ),
                filled: true,
                fillColor: primaryAccent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none),
                hintText: searchHintText,
                counterText: "",
              ),
            ),
          )),
    );
  }
}

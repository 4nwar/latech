import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/search_product/controllers/search_product_controller.dart';
import 'package:iconsax/iconsax.dart';

class SearchProductView extends GetView<SearchProductController> {
  const SearchProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: primary,
        title: new Text(
          "Product Halal",
        ),
        elevation: 0,
      ),
      body: new Column(
        children: [
          new Container(
            color: primary,
            child: new Padding(
              padding: const EdgeInsets.all(8),
              child: new Card(
                elevation: 0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(16)),
                child: new ListTile(
                  title: Row(
                    children: [
                      Icon(Iconsax.search_normal_1, size: 20),
                      SizedBox(width: 8), // Spasi antara ikon dan input
                      Expanded(
                        child: TextField(
                          // controller: ,
                          decoration: InputDecoration(
                            hintText: "Search Product",
                            border: InputBorder.none, // Hapus garis tepi
                          ),
                          style: TextStyle(fontSize: 16), // Atur ukuran teks
                          // onChanged: , ini isi dengan fungsi controller seperti di home
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // disini untuk membuat textfield jadi kosong
                        },
                        icon: Icon(Iconsax.close_circle, size: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Expanded(
            child: ListView.builder(
              itemCount: 10, //diubah sesuai dengan panjang data
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                  child: new Card(
                    elevation: 0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(16)),
                    child: new Stack(
                      children: [
                        new ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            //resultcard akan di ubah jadi ornament card transparant
                            resultCard,
                            fit: BoxFit.cover,
                            width: getDeviceWidth(context),
                            //tinggi inanti sesuaikan
                            height: 150,
                          ),
                        ),
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(4, 170, 137, 1),
                                    Color.fromRGBO(55, 217, 178, 0.9)
                                  ])),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, top: 20),
                                  child: Text(
                                    "Nama Product", //ubah api
                                    style:
                                        textCustom(semiBoldFont, 20, Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Nama Pt", //ubah api
                                    style: textCustom(mediumFont, 14, Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "no_sertif", //ubah api
                                    style: textCustom(
                                        mediumFont, 14, Colors.white),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    // margin: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                        "12-10-2000", //ini ubah sesuai api
                                        style: textCustom(
                                            mediumFont, 12, Colors.white)),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

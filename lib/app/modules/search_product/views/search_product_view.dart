import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/product.dart';
import 'package:halalin/app/modules/search_product/controllers/search_product_controller.dart';
import 'package:iconsax/iconsax.dart';

class SearchProductView extends GetView<SearchProductController> {
  final TextEditingController searchController = TextEditingController();
  SearchProductView({super.key});

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
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Search Product",
                            border: InputBorder.none, // Hapus garis tepi
                          ),
                          style: TextStyle(fontSize: 16), // Atur ukuran teks
                          // ini isi dengan fungsi controller seperti di home
                          onChanged: (value) {
                            // Fungsi pencarian berdasarkan input value
                            controller.searchProducts(value);
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // disini untuk membuat textfield jadi kosong
                          searchController.clear();
                          searchController.text = '';
                          controller.isLoading.value = false;
                        },
                        icon: Icon(Iconsax.close_circle, size: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Expanded(child: Obx(
            (() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                final productList = controller.productList;
                if (productList.isEmpty) {
                  return Center(child: Text('Tidak ada hasil.'));
                }
                return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    // Tampilkan hasil pencarian di sini
                    return SizedBox(
                      height : 180,
                      child: buildProductCard(productList[index]),
                    );
                  },
                );
              }
            }),
          ))
        ],
      ),
    );
  }

  Widget buildProductCard(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
      child: new Card(
        elevation: 1,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(16)),
        child: SizedBox.expand(
          child: new Stack(
            children: [
              Container(
                // height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(4, 170, 137, 1),
                          Color.fromRGBO(55, 217, 178, 0.9)
                        ]
                    )
                ),
              ),
              new ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  //resultcard akan di ubah jadi ornament card transparant
                  ornamentProduct,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  //tinggi inanti sesuaikan
                  // height: 150,
                ),
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
                          product.regProdName, //ubah api
                          style: textCustom(semiBoldFont, 20, Colors.white),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          product.pelakuUsaha.namaPu, //ubah api
                          style: textCustom(mediumFont, 14, Colors.white),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 10),maxLines: 2,
                    
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.sertifikat.noSert, //ubah api
                          style: textCustom(mediumFont, 14, Colors.white),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          // margin: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(product.sertifikat.tglSert, //ini ubah sesuai api
                              style: textCustom(mediumFont, 12, Colors.white)),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
}

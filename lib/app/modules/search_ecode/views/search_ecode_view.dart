import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/search_ecode/controllers/search_ecode_controller.dart';
import 'package:iconsax/iconsax.dart';

class SearchEcodeView extends GetView<SearchEcodeController> {
  const SearchEcodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: primary,
        title: new Text(
          "E-code Halal",
        ),
        elevation: 0,
      ),
      body: new Column(
        children: [
          //search input
          new Container(
            color: primary,
            child: new Padding(
              padding: const EdgeInsets.all(8),
              child: new Card(
                elevation: 0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10)),
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
            itemCount: 10, //ubah sesuai banak di api
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                child: new Card(
                  elevation: 1,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors
                                .amber[100] //diubah sesuai status klo bisa
                            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          ornamentEcode,
                          fit: BoxFit.cover,
                          width: getDeviceWidth(context),
                          height: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nama E-code",
                                style: const TextStyle(fontSize: 16),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ), //ubah sesuai api
                              Text(
                                "E-code",
                                style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight:
                                          FontWeight.w600)), //ubah sesuai api
                              Row()
                              // ubah cukup satau status jadi gak pake row
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}

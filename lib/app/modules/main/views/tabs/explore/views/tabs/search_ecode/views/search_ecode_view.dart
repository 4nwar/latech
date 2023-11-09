import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/ecode.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../../../ui/ecodeCard_widget.dart';
import '../controllers/search_ecode_controller.dart';

class SearchEcodeView extends GetView<SearchEcodeController> {
  SearchEcodeView({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ecodeList = controller.ecodeList;
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
                            hintText: "Search Ecode",
                            border: InputBorder.none, // Hapus garis tepi
                          ),
                          style: TextStyle(fontSize: 16), // Atur ukuran teks
                          onChanged: (Value) {
                            controller.searchEcode(Value);
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
          new Expanded(child: Obx((() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              final ecodeList = controller.ecodeList;
              if (ecodeList.isEmpty) {
                // return Center(child: Text('Tidak ada hasil.'));
                // searchController.clear();
                // searchController.text = '';
                controller.searchEcode("");
                // controller.isLoading.value = false;
              }
              return ListView.builder(
                itemCount: ecodeList.length,
                itemBuilder: (context, index) {
                  // Tampilkan hasil pencarian di sini
                  return SizedBox(
                    height: 160,
                    child: buildEcodeCard(ecodeList[index], context),
                  );
                },
              );
            }
          }))
          )
        ],
      ),
    );
  }

  // Widget buildEcodeCard(EcodeModel ecode) {
  //   Color cardColor;
  //   Color statusColor;

  //   // Tentukan warna kartu berdasarkan status dari API
  //   switch (ecode.status.toLowerCase()) {
  //     case "doubtful":
  //       cardColor = Colors.amber.shade100;
  //       statusColor = Colors.amber.shade400;
  //       break;
  //     case "halal":
  //       cardColor = Colors.green.shade100;
  //       statusColor = Colors.green.shade400; // Ganti warna sesuai dengan status
  //       break;
  //     default:
  //       cardColor = Colors.red.shade100;
  //       statusColor = Colors.red.shade400;

  //       break;
  //   }
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
  //     child: new Card(
  //       elevation: 1,
  //       shape: new RoundedRectangleBorder(
  //           borderRadius: new BorderRadius.circular(10)),
  //       child: SizedBox.expand(
  //         child: Stack(
  //           children: [
  //             Container(
  //               // height: 150,
  //               width: double.infinity,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10),
  //                   color: cardColor //diubah sesuai status klo bisa
  //                   ),
  //             ),
  //             ClipRRect(
  //               borderRadius: BorderRadius.circular(10),
  //               child: Image.asset(
  //                 ornamentEcode,
  //                 fit: BoxFit.cover,
  //                 width: double.infinity,
  //                 // height: 150,
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(24),
  //               child: SizedBox(
  //                 height: 100,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       ecode.name,
  //                       style: const TextStyle(fontSize: 16),
  //                       maxLines: 1,
  //                       softWrap: false,
  //                       overflow: TextOverflow.ellipsis,
  //                     ), //ubah sesuai api
  //                     Text(ecode.id,
  //                         style: const TextStyle(
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.w600)), //ubah sesuai api
  //                     //disin tempat widget status sesuai dengan nilai dari api
  //                     // ubah cukup satau status jadi gak pake row
  //                     Container(
  //                       padding:
  //                           EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //                       // margin: EdgeInsets.all(12),
  //                       decoration: BoxDecoration(
  //                         color: statusColor,
  //                         borderRadius: BorderRadius.circular(8),
  //                       ),
  //                       child: Text(ecode.status,
  //                           // "News", //ini ubah sesuai api
  //                           style: textCustom(mediumFont, 14, Colors.white)),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

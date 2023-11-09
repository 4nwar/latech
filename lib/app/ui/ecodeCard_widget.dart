import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';

import '../constant/values.dart';
import '../data/models/ecode.dart';
import '../routes/app_pages.dart';

Widget buildEcodeCard(EcodeModel ecode, context) {
  Color cardColor;
  Color statusColor;

  // Tentukan warna kartu berdasarkan status dari API
  switch (ecode.status.toLowerCase()) {
    case "doubtful":
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
    padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
    child: Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.DETAIL_ECODE, arguments:ecode);
        },
        child: SizedBox.expand(
          child: Stack(
            children: [
              Container(
                width: getDeviceWidth(context),
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
                  width: getDeviceWidth(context),
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
                        ecode.name,
                        style: const TextStyle(fontSize: 16),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        ecode.id,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          ecode.status,
                          style: textCustom(mediumFont, 14, Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildDetailEcodeCard(EcodeModel ecode, context) {
  Color cardColor;
  Color statusColor;

  // Tentukan warna kartu berdasarkan status dari API
  switch (ecode.status.toLowerCase()) {
    case "doubtful":
      cardColor = Colors.amber.shade100;
      statusColor = Colors.amber.shade400;
      break;
    case "halal":
      cardColor = Colors.green.shade100;
      statusColor = Colors.green.shade400; // Ganti warna sesuai dengan status
      break;
    default:
      cardColor = Colors.red.shade100;
      statusColor = Colors.red.shade400;

      break;
  }
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: new Card(
      elevation: 1,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10)),
      child: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              // height: 150,
              width: getDeviceWidth(context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cardColor //diubah sesuai status klo bisa
                  ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                ornamentEcode,
                fit: BoxFit.cover,
                width: getDeviceWidth(context),
                // height: 150,
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
                      ecode.name,
                      style: const TextStyle(fontSize: 16),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ), //ubah sesuai api
                    Text(ecode.id,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600)), //ubah sesuai api
                    //disin tempat widget status sesuai dengan nilai dari api
                    // ubah cukup satau status jadi gak pake row
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      // margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(ecode.status,
                          // "News", //ini ubah sesuai api
                          style: textCustom(mediumFont, 14, Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

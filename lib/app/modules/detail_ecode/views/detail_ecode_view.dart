import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:halalin/app/data/models/ecode.dart';
import 'package:halalin/app/ui/ecodeCard_widget.dart';

import '../../../constant/theme.dart';

class DetailEcodeView extends StatelessWidget {
  const DetailEcodeView({super.key});

  @override
  Widget build(BuildContext context) {
    EcodeModel ecode = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: new Text(
          "E-code Detail",
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),  
        children: [
          SizedBox(
            height: 160,
            child: buildDetailEcodeCard(ecode, context)
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'E-CODE',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            ecode.id,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            ecode.name,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Type',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            ecode.category,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Desc',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            ecode.detail,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
import 'package:financesapp/app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'assets_names.dart';
import 'colors_utils.dart';
import 'font_style.dart';

class CustomSingOutShowDialog extends StatelessWidget {
  final String text;

  CustomSingOutShowDialog({
    Key key,
    this.text = "",
  }) : super();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsCustom.splashColor2,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(28.0),
        topRight: Radius.circular(28.0),
        topLeft: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
      )),
      content: Container(
        height: 130,
        child: Column(
          children: [
            SizedBox(
                height: 100, width: MediaQuery.of(context).size.width, child: Lottie.asset(NamesCustom.CELLMONEY2)),
            Text(
              text,
              style: FontStyleCustom.h3(fontColor: ColorsCustom.bodyText1, fontWeight: FWT.light),
            ),
          ],
        ),
      ),
      actions: [
        /// Negative button
        TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },
            child: Text(("Não"), style: TextStyle(fontSize: 18, color: ColorsCustom.primary))),
        TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              Get.find<HomeController>().sighOut();
            },
            child: const Text(("Sim"), style: TextStyle(fontSize: 18, color: Colors.white))),
      ],
    );
  }
}

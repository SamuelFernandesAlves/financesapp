import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'assets_names.dart';
import 'colors_utils.dart';
import 'font_style.dart';

class CustomShowDialog extends StatelessWidget {

  final String text;

  CustomShowDialog({
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
      content: SizedBox(
        child: Text(
          text,
          style: FontStyleCustom.h3(fontColor: ColorsCustom.bodyText1, fontWeight: FWT.light),
        ),
      ),
      actions: [
        /// Negative button
        TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },
            child: const Text(("OK"),
                style: TextStyle(fontSize: 18, color: Colors.white))),
      ],
    );
  }
}
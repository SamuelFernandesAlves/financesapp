import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utilities/assets_names.dart';
import '../../utilities/colors_utils.dart';
import '../controller/initial_controller.dart';

class InitialPage extends StatefulWidget {
  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final controller = Get.find<InitialController>();

  @override
  void initState() {
    // controller.onInit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorsCustom.splashColor,
                ColorsCustom.splashColor2,
              ],
            )),
        child:  Center(
          child: SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Lottie.asset(NamesCustom.ASTRONAUTA),
          ),
        ),
      ),
    );
  }
}

import 'package:brasil_fields/brasil_fields.dart';
import 'package:financesapp/app/common/receita_buttom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../modules/add_receita/controller/add_receita_controller.dart';
import '../modules/home/controller/home_controller.dart';
import '../modules/routes/app_routes.dart';
import '../modules/utilities/colors_utils.dart';
import '../modules/utilities/font_style.dart';

class AppBarHome extends StatelessWidget {
  AppBarHome({Key key}) : super(key: key);
  final controller = Get.find<HomeController>();
  final controllerAdd = Get.find<AddReceitaController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorsCustom.appBarColor,
          ),
          height: 320,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                DateFormat(DateFormat.MONTH, 'pt_Br').format(DateTime.now()).toUpperCase(),
                style: FontStyleCustom.t2(
                  fontColor: ColorsCustom.bodyText1,
                  fontWeight: FWT.regular,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Saldo em conta",
                style: FontStyleCustom.t2(
                  fontColor: ColorsCustom.bodyText2,
                  fontWeight: FWT.light,
                ),
              ),
              Text(
           controller.visibleValue.value ? UtilBrasilFields.obterReal(controller.totalGeral.toDouble()) ?? "0.0" : "------",
                style: FontStyleCustom.h5(
                  fontColor: ColorsCustom.bodyText1,
                  fontWeight: FWT.regular,
                ),
              ),
              IconButton(
                  onPressed: () async {
                    controller.openVisibleValues();
                  },
                  icon: Icon(
                    controller.visibleValue.value ? Icons.remove_red_eye_outlined : CupertinoIcons.eye_slash_fill,
                    color: ColorsCustom.bodyText2,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 15),
                child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          controllerAdd.tipo.value = true;
                          Get.toNamed(Routes.ADDRECEITA);
                        },
                        child: ReceitaButtom(
                          isReceita: true,
                          value: UtilBrasilFields.obterReal(controller.totalRceita.toDouble())?? "0.0",
                          visible: controller.visibleValue.value,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          controllerAdd.tipo.value = false;
                          Get.toNamed(Routes.ADDRECEITA);
                        },
                        child: ReceitaButtom(
                          isReceita: false,
                          value: UtilBrasilFields.obterReal(controller.totalDespesas.toDouble()) ?? "0.0",
                          visible: controller.visibleValue.value,
                        ),
                      ),
                      // ReceitaButtom(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

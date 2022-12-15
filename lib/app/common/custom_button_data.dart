import 'package:financesapp/app/modules/add_receita/controller/add_receita_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/utilities/colors_utils.dart';
import '../modules/utilities/font_style.dart';

class CustomButtomData extends StatefulWidget {

  CustomButtomData({Key key}) : super(key: key);

  @override
  State<CustomButtomData> createState() => _CustomButtomDataState();
}

class _CustomButtomDataState extends State<CustomButtomData> {
  final controller = Get.find<AddReceitaController>();


  @override
  void initState() {
    controller.receitaModel.data = DateTime.now();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                controller.receitaModel.data = DateTime.now();
                if (kDebugMode) {
                  print(controller.dataSelected);
                }
                controller.hoje.value = true;
                controller.ontem.value = false;
                controller.outro.value = false;
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: controller.hoje.isTrue ? ColorsCustom.primary : ColorsCustom.offButtom,
                ),
                height: 31,
                width: 80,
                child: Center(
                  child: Text(
                    "Hoje",
                    style: FontStyleCustom.t1(
                      fontColor: ColorsCustom.secondary,
                      fontWeight: FWT.medium,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                controller.receitaModel.data = DateTime.now().subtract(const Duration(days: 1));
                if (kDebugMode) {
                  print(controller.dataSelected);
                }
                controller.hoje.value = false;
                controller.ontem.value = true;
                controller.outro.value = false;
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: controller.ontem.isTrue ? ColorsCustom.primary : ColorsCustom.offButtom,
                ),
                height: 31,
                width: 80,
                child: Center(
                  child: Text(
                    "Ontem",
                    style: FontStyleCustom.t1(
                      fontColor: ColorsCustom.secondary,
                      fontWeight: FWT.medium,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () async {
                controller.hoje.value = false;
                controller.ontem.value = false;
                controller.outro.value = true;


                controller.receitaModel.data = await showDatePicker(
                  context: context,
                  builder: (context, child) {
                    return Theme(
                        data: Theme.of(context).copyWith(
                          dialogBackgroundColor: ColorsCustom.splashColor,
                          colorScheme: ColorScheme.light(
                            primary: ColorsCustom.primary, // header background color
                            onPrimary: ColorsCustom.borderTextForm, //  header text color
                            onSurface: ColorsCustom.borderTextForm,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                                backgroundColor: ColorsCustom.splashColor,
                            ),
                          ),
                        ),
                        child: child);
                  },
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime.now(),
                );
                controller.receitaModel.data??= DateTime.now();
                if (kDebugMode) {
                  print(controller.dataSelected);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: controller.outro.isTrue ? ColorsCustom.primary : ColorsCustom.offButtom,
                ),
                height: 31,
                width: 80,
                child: Center(
                  child: Text(
                    "Outro",
                    style: FontStyleCustom.t1(
                      fontColor: ColorsCustom.secondary,
                      fontWeight: FWT.medium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

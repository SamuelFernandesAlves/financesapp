import 'package:financesapp/app/modules/add_receita/controller/add_receita_controller.dart';
import 'package:financesapp/app/modules/home/widgets/card_historico.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../common/app_bar_home.dart';
import '../../../common/custom_circular_indicator.dart';
import '../../routes/app_routes.dart';
import '../../utilities/assets_names.dart';
import '../../utilities/colors_utils.dart';
import '../../utilities/font_style.dart';
import '../../utilities/show_dialog_singOut.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();
  final controllerAdd = Get.find<AddReceitaController>();

  @override
  void initState() {
    // controller.onInit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomSingOutShowDialog(
              text: "Realmente deseja sair?",
            );
          },
        );
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
              onRefresh: () async {
                await controller.onInit();
              },
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                  ColorsCustom.splashColor,
                  ColorsCustom.splashColor2,
                ])),
                child: Obx(() {
                  if (controller.loadDados.isTrue) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: Lottie.asset(NamesCustom.CELLMONEY2)),
                          const CustomCicurlarProgressIndicator(),
                        ],
                      ),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height:MediaQuery.of(context).size.height ,
                        child: Column(
                          children: [
                            Expanded(
                              flex:5,
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    AppBarHome(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 26,left: 26),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 15,),
                                          Row(
                                            children: [
                                              Text(
                                                "Bem vindo (a):  ",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: FontStyleCustom.t3(
                                                  fontColor: ColorsCustom.bodyText1,
                                                  fontWeight: FWT.regular,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  "${controller.usuario.nome}",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: FontStyleCustom.t2(
                                                    fontColor: ColorsCustom.bodyText1,
                                                    fontWeight: FWT.regular,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                CupertinoIcons.chart_bar,
                                                color: ColorsCustom.bodyText1,
                                                size: 22,
                                              ), const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Histórico",
                                                style: FontStyleCustom.t2(
                                                  fontColor: ColorsCustom.bodyText1,
                                                  fontWeight: FWT.regular,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Útimas transações",
                                            style: FontStyleCustom.t2(
                                              fontColor: ColorsCustom.bodyText1,
                                              fontWeight: FWT.light,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),
                            Expanded(
                              flex:3,
                              // height: MediaQuery.of(context).size.height - 425,
                              child: Obx(() {
                                if (controller.receitas.isEmpty) {
                                  return  Text(
                                    "Lista vazia...",
                                    style: FontStyleCustom.t2(
                                      fontColor: ColorsCustom.offButtom,
                                      fontWeight: FWT.regular,
                                    ),
                                  );
                                } else {
                                  return NotificationListener<OverscrollIndicatorNotification>(
                                    onNotification: (OverscrollIndicatorNotification overscroll) {
                                      overscroll.disallowIndicator();
                                      return true; // or false
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 26,left: 26),
                                      child: ListView.builder(
                                        itemCount: controller.receitas.length,
                                        itemBuilder: (context, index) {
                                          return CardHistorico(receitaModel: controller.receitas[index]);
                                        },
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),

                          ],
                        ),
                      ),
                    );
                  }
                })),
          ),
          floatingActionButton: SpeedDial(
            spacing: 8,
            spaceBetweenChildren: 8,
            animatedIcon: AnimatedIcons.menu_close,
            overlayOpacity: 0.6,
            overlayColor: ColorsCustom.flaotButtom,
            closeManually: false,
            children: [
              SpeedDialChild(
                  onTap: () async {
                    controllerAdd.tipo.value = false;
                    Get.toNamed(Routes.ADDRECEITA);
                  },
                  label: "Despesa",
                  child: const Icon(
                    Icons.arrow_downward_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                  backgroundColor: ColorsCustom.despesaColor),
              SpeedDialChild(
                  onTap: () async {
                    controllerAdd.tipo.value = true;
                    Get.toNamed(Routes.ADDRECEITA);
                  },
                  label: "Receita",
                  child: const Icon(
                    Icons.arrow_upward_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                  backgroundColor: ColorsCustom.receitaColor),
            ],
            backgroundColor: ColorsCustom.flaotButtom,
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  Future showToast(String message) async {
    await Fluttertoast.cancel();
  }
}

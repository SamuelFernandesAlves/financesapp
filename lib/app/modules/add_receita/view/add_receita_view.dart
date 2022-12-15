import 'package:brasil_fields/brasil_fields.dart';
import 'package:financesapp/app/common/custom_button_data.dart';
import 'package:financesapp/app/modules/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../common/custom_text_field.dart';
import '../../utilities/assets_names.dart';
import '../../utilities/colors_utils.dart';
import '../../utilities/font_style.dart';
import '../../utilities/show_dialog.dart';
import '../controller/add_receita_controller.dart';

class AddReceitaView extends StatefulWidget {
  const AddReceitaView( {Key key}) : super(key: key);

  @override
  State<AddReceitaView> createState() => _AddReceitaViewState();
}

class _AddReceitaViewState extends State<AddReceitaView> {
  final controller = Get.find<AddReceitaController>();
  @override
  void initState() {
    controller.onInit();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(  
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                            children: [
                              Positioned(
                                height: 700,
                                width: MediaQuery.of(context).size.width,
                                top: 0,
                                child: Container(
                                  color: ColorsCustom.appBarColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: const Icon(
                                              Icons.arrow_back_rounded,
                                              color: ColorsCustom.bodyText1,
                                            ),
                                          ),
                                          Text(
                                            controller.tipo.value == true ? NamesCustom.RECEITA : NamesCustom.DESPESA,
                                            style: FontStyleCustom.t2(
                                              fontColor: ColorsCustom.bodyText1,
                                              fontWeight: FWT.regular,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Valor",
                                              style: FontStyleCustom.t2(
                                                fontColor: ColorsCustom.bodyText2,
                                                fontWeight: FWT.regular,
                                              ),
                                            ),
                                            CustomTextField(
                                              isBorder: false,
                                              keyboardType: TextInputType.number,
                                              inputFormatter: [
                                                FilteringTextInputFormatter.digitsOnly,
                                                CentavosInputFormatter(moeda: false, casasDecimais: 2)
                                              ],
                                              validator: (value) {
                                                {
                                                  if (controller.valueEmText.length <= 1) {
                                                    return "Digite algum valor";
                                                  }
                                                }
                                                return null;
                                              },
                                              onSaved: (input) => controller.valueEmText= input,
                                              onChange: (input) => controller.valueEmText = input,
                                              height: 70,
                                              textStyle: FontStyleCustom.h5(
                                                fontColor: ColorsCustom.bodyText2,
                                                fontWeight: FWT.regular,
                                              ),
                                              hintStyle: FontStyleCustom.h5(
                                                fontColor: ColorsCustom.bodyText2,
                                                fontWeight: FWT.regular,
                                              ),
                                              hint: "R\$ 00,00",
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  top: 200,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                ColorsCustom.splashColor,
                                                ColorsCustom.splashColor2,
                                              ],
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              crossAxisAlignment:  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                CustomTextField(
                                                  validator: (value) {
                                                    {
                                                      if (controller.receitaModel.title.length <= 3) {
                                                        return "Digite uma título com pelo menos 3 caracteres";
                                                      }
                                                    }
                                                    return null;
                                                  },
                                                  onChange: (input) => controller.receitaModel.title = input,
                                                  onSaved: (input) => controller.receitaModel.title = input,
                                                        maxLenght: 20,
                                                  // controller: controller.title,
                                                  height: 70,
                                                  textStyle: FontStyleCustom.t2(
                                                    fontColor: ColorsCustom.bodyText1,
                                                    fontWeight: FWT.regular,
                                                  ),
                                                  hint: "Título",
                                                  onTap: () {},
                                                  prefixIcon: Icon(
                                                    Icons.info_outline,
                                                    color: ColorsCustom.bodyText2,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10, top: 15, right: 15),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.calendar_month_sharp,
                                                        color: ColorsCustom.bodyText2,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Flexible(child: CustomButtomData()),
                                                    ],
                                                  ),

                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 1,
                                                  color: ColorsCustom.bodyText1,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                CustomTextField(
                                                  maxLenght: 50,
                                                  validator: (value) {
                                                    {
                                                      if (controller.receitaModel.description.length <= 3) {
                                                        return "Digite uma descrição com pelo menos 3 caracteres";
                                                      }
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (input) => controller.receitaModel.description = input,
                                                  onChange: (input) => controller.receitaModel.description = input,
                                                  // controller: controller.descricao,
                                                  height: 70,
                                                  textStyle: FontStyleCustom.t2(
                                                    fontColor: ColorsCustom.bodyText1,
                                                    fontWeight: FWT.regular,
                                                  ),
                                                  hint: "Descrição",
                                                  onTap: () {},
                                                  prefixIcon: Icon(
                                                    CupertinoIcons.square_list,
                                                    color: ColorsCustom.bodyText2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                if (controller.tipo.value == true) {
                  controller.receitaModel.tip = NamesCustom.RECEITA;
                } else {
                  controller.receitaModel.tip = NamesCustom.DESPESA;
                }
                controller.validate().then((value) {
                  if (value == "SUCCESS") {
                    Get.find<HomeController>().recuperarDadosUser();
                    Get.back();
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomShowDialog(
                          text:"Dados adicionado com sucesso",
                        );
                      },
                    );
                  }else{
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomShowDialog(
                          text: value,
                        );
                      },
                    );
                  }
                });
                // print(controller.receitaModel.toMap());

                /// Add your onPressed code here!
              },
              backgroundColor: ColorsCustom.receitaColor,
              child: const Icon(
                Icons.check,
                size: 25,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          ),
    ));
  }
}

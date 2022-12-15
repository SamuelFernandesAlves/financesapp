import 'package:brasil_fields/brasil_fields.dart';
import 'package:financesapp/app/modules/utilities/assets_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/receita_model.dart';
import '../../utilities/colors_utils.dart';
import '../../utilities/font_style.dart';

class CardHistorico extends StatelessWidget {
  final bool isReceita;
  final double height;
  final double width;
  final ReceitaModel receitaModel;
  // final ReceitaModel receitaModel = ReceitaModel();

  CardHistorico({Key key,
    this.isReceita = true,
    this.receitaModel,
    this.height,
    this.width}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height ?? 110,
      width: width ?? MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                receitaModel.title ?? "Software Escola",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: FontStyleCustom.t2(
                  fontColor: ColorsCustom.bodyText1,
                  fontWeight: FWT.regular,
                ),
              ),
              Text(
                DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY, 'pt_Br').format(receitaModel.data).toUpperCase(),
                maxLines:2,
                overflow: TextOverflow.ellipsis,
                style: FontStyleCustom.t3(
                  fontColor: ColorsCustom.bodyText3,
                  fontWeight: FWT.regular,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            receitaModel.tip == NamesCustom.RECEITA ? "Receita" : "Despesa",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: FontStyleCustom.t1(

              fontColor: receitaModel.tip == NamesCustom.RECEITA ? ColorsCustom.receitaColor : ColorsCustom.despesaColor,
              fontWeight: FWT.regular,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            UtilBrasilFields.obterReal(receitaModel.value.toDouble()) ?? "0.0",
            style: FontStyleCustom.t1(
              fontColor: ColorsCustom.bodyText1,
              fontWeight: FWT.light,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Descrição: ${receitaModel.description}",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: FontStyleCustom.t1(
              fontColor: ColorsCustom.bodyText1,
              fontWeight: FWT.light,
            ),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          const SizedBox(height: 50,)
        ],

      ),
    );
  }
}

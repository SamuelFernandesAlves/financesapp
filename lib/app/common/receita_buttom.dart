import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/utilities/colors_utils.dart';
import '../modules/utilities/font_style.dart';

class ReceitaButtom extends StatelessWidget {
  final bool isReceita;
  final bool visible;
  final String value;

  const ReceitaButtom({Key key, this.value = "0,00", this.isReceita = true, this.visible = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 130,
      child: Row(
        children: [ 
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isReceita ? ColorsCustom.receitaColor : ColorsCustom.despesaColor,
            ),
            height: 44,
            width: 44,
            child: SizedBox(
              height: 20,
              width: 16,
              child: Icon(
                isReceita ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
                color: ColorsCustom.bodyText2,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isReceita ? "Receitas" : "Despesas",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyleCustom.t1(
                    fontColor: isReceita ? ColorsCustom.bodyText2 : ColorsCustom.bodyText2,
                    fontWeight: FWT.light,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    visible ?  value : "--------",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: FontStyleCustom.t1(
                      fontColor: isReceita ? ColorsCustom.receitaColor : ColorsCustom.despesaColor,
                      fontWeight: FWT.regular,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

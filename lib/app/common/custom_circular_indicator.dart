import 'package:financesapp/app/modules/utilities/colors_utils.dart';
import 'package:flutter/material.dart';

class CustomCicurlarProgressIndicator extends StatelessWidget{
  final double height;
  final double width;

  const CustomCicurlarProgressIndicator({Key key,
    this.height = 40,
    this.width = 40,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return SizedBox(
       height: height,
       width: width,
       child: const CircularProgressIndicator(
        color: ColorsCustom.borderTextForm,
    ),
     );
  }
}
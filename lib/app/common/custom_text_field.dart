import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modules/utilities/colors_utils.dart';
import '../modules/utilities/font_style.dart';

typedef OnChangeValue = void Function(String);

/// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String icon;
  final FormFieldValidator<String> validator;
  final String title;
  final Widget suffixIcon;
  final String suffixText;
  final Widget prefixIcon;
  final Color prefixIconColor;
  final String hint;
  final bool obsecure;
  final bool isBorder;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final double height;
  final double width;
  final TextInputType keyboardType;
  final VoidCallback onTap;
  final OnChangeValue onChange;
  final List<TextInputFormatter> inputFormatter;
  final FormFieldSetter<String> onSaved;
  final int maxLine;
  final int maxLenght;

  CustomTextField({
    Key key,
    this.validator,
    this.controller,
    this.maxLine,
    this.maxLenght,
    this.onSaved,
    this.icon,
    this.textStyle,
    this.hint,
    this.hintStyle,
    this.prefixIconColor,
    this.obsecure = false,
    this.keyboardType,
    this.height,
    this.prefixIcon,
    this.width,
    this.title,
    this.isBorder = true,
    this.onTap,
    this.onChange,
    this.inputFormatter,
    this.suffixIcon,
    this.suffixText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(width: suffixIcon != null ? 10 : 0),
        // suffixIcon ?? const SizedBox(),
        // SizedBox(width: suffixIcon != null ? 10 : 0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              TextFormField(
                inputFormatters: inputFormatter ?? [],
                maxLines: maxLine ?? 1,
                maxLength: maxLenght,
                onSaved: onSaved,
                validator: validator,
                cursorColor: ColorsCustom.bodyText2,
                controller: controller,
                obscureText: obsecure,
                keyboardType: keyboardType ?? TextInputType.text,
                onTap: onTap ?? () {},
                onChanged: onChange ?? (String value) {},
                decoration: InputDecoration(
                    helperStyle: FontStyleCustom.t3(
                      fontColor: ColorsCustom.bodyText2,
                      fontWeight: FWT.regular,
                    ),
                    hintText: hint,
                    hintStyle: hintStyle ??
                        FontStyleCustom.t1(
                          fontColor: ColorsCustom.bodyText2,
                          fontWeight: FWT.regular,
                        ),
                    enabledBorder: isBorder == false
                        ? const UnderlineInputBorder(
                            borderSide: BorderSide(width: 0, color: Colors.transparent),
                          )
                        : const UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: ColorsCustom.borderTextForm),
                          ),
                    focusedBorder:  isBorder == false
                        ? const UnderlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.transparent),
                    ):UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: ColorsCustom.primary),
                    ),
                    prefixIcon: prefixIcon),
                style: textStyle ??
                    FontStyleCustom.t1(
                      fontColor: ColorsCustom.borderTextForm,
                      fontWeight: FWT.regular,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

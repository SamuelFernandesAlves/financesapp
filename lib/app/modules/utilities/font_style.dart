import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

enum FWT {
  light,
  regular,
  medium,
  semiBold,
  bold,
}

class FontStyleCustom {
  static FontWeight getFontWeight({FWT fontWeight = FWT.regular}) {
    switch (fontWeight) {
      case FWT.bold:
        return FontWeight.w700;
        break;
      case FWT.semiBold:
        return FontWeight.w600;
        break;
      case FWT.medium:
        return FontWeight.w500;
        break;
      case FWT.regular:
        return FontWeight.w400;
        break;
      case FWT.light:
        return FontWeight.w300;
        break;
      default:
        return FontWeight.w400;
        break;
    }
  }

  ///Tá pensando em viajar
  static TextStyle h1({
     Color fontColor,
     FWT fontWeight,
  }) {
    return GoogleFonts.poppins(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 32,
    );
  }

  ///Texto tela de Splash
  static TextStyle h2({
     Color fontColor,
     FWT fontWeight,
  }) {
    return GoogleFonts.poppins(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 26,
    );
  }

  ///Segundo titulo tela inicial
  static TextStyle h3({
     Color fontColor,
     FWT fontWeight,
  }) {
    return GoogleFonts.poppins(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 16,
    );
  }



  ///Titulo de resultado
  static TextStyle h4({
     Color fontColor,
     FWT fontWeight,
  }) {
    return GoogleFonts.poppins(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 20,
    );
  }

  static TextStyle h5({
    Color fontColor,
    FWT fontWeight,
  }) {
    return GoogleFonts.poppins(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 28,
    );
  }

  ///Texto padrão
  static TextStyle t1({
     Color fontColor,
     FWT fontWeight,
  }) {
    return GoogleFonts.poppins(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 14,
    );
  }
  static TextStyle t2({
    Color fontColor,
    FWT fontWeight,
  }) {
    return GoogleFonts.poppins(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 16,
    );
  }
  static TextStyle t3({
    Color fontColor,
    FWT fontWeight,
  }) {
    return GoogleFonts.poppins(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 12,
    );
  }
}
